import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/add_ventor_favorite_listener_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_find_listeners_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/remove_ventor_favorite_listener_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_find_listeners_mapper.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';

part 'ventor_find_listeners_bloc.freezed.dart';
part 'ventor_find_listeners_event.dart';
part 'ventor_find_listeners_state.dart';

class VentorFindListenersBloc
    extends Bloc<VentorFindListenersEvent, VentorFindListenersState> {
  VentorFindListenersBloc(
    this._getVentorFindListenersUsecase,
    this._addVentorFavoriteListenerUsecase,
    this._removeVentorFavoriteListenerUsecase,
  ) : super(const VentorFindListenersState()) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_QueryChanged>(_onQueryChanged);
    on<_TopicChanged>(_onTopicChanged);
    on<_FiltersChanged>(_onFiltersChanged);
    on<_FavoriteToggled>(_onFavoriteToggled);
    on<_ListenerFavoriteUpdated>(_onListenerFavoriteUpdated);
  }

  static const _searchDebounce = Duration(milliseconds: 350);

  final GetVentorFindListenersUsecase _getVentorFindListenersUsecase;
  final AddVentorFavoriteListenerUsecase _addVentorFavoriteListenerUsecase;
  final RemoveVentorFavoriteListenerUsecase
  _removeVentorFavoriteListenerUsecase;

  var _queryGeneration = 0;

  Future<void> _onStarted(
    _Started event,
    Emitter<VentorFindListenersState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<VentorFindListenersState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<VentorFindListenersState> emit,
  ) async {
    await _load(emit, showLoading: false);
  }

  Future<void> _onQueryChanged(
    _QueryChanged event,
    Emitter<VentorFindListenersState> emit,
  ) async {
    emit(state.copyWith(query: event.query));
    final generation = ++_queryGeneration;
    await Future<void>.delayed(_searchDebounce);
    if (emit.isDone || generation != _queryGeneration) return;
    await _load(emit, showLoading: false);
  }

  Future<void> _onTopicChanged(
    _TopicChanged event,
    Emitter<VentorFindListenersState> emit,
  ) async {
    if (event.topicIndex == state.topicIndex) return;
    _queryGeneration++;
    emit(state.copyWith(topicIndex: event.topicIndex));
    await _load(emit);
  }

  Future<void> _onFiltersChanged(
    _FiltersChanged event,
    Emitter<VentorFindListenersState> emit,
  ) async {
    _queryGeneration++;
    emit(state.copyWith(filters: event.filters));
    await _load(emit);
  }

  void _onListenerFavoriteUpdated(
    _ListenerFavoriteUpdated event,
    Emitter<VentorFindListenersState> emit,
  ) {
    emit(
      state.copyWith(
        listeners: [
          for (final listener in state.listeners)
            if (listener.id == event.listener.id) event.listener else listener,
        ],
      ),
    );
  }

  Future<void> _load(
    Emitter<VentorFindListenersState> emit, {
    bool showLoading = true,
  }) async {
    if (showLoading) {
      emit(
        state.copyWith(
          status: VentorFindListenersStatus.loading,
          errorMessage: '',
        ),
      );
    } else {
      emit(state.copyWith(isRefreshing: true, errorMessage: ''));
    }

    final topicIndex = state.topicIndex.clamp(
      0,
      VentorSessionsCatalog.topicIds.length - 1,
    );
    final topicId = VentorSessionsCatalog.topicIds[topicIndex];

    try {
      final result = await _getVentorFindListenersUsecase(
        ventorFindListenersQueryFromUi(
          query: state.query,
          topicId: topicId,
          filters: state.filters,
        ),
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorFindListenersBloc: load failed — $message',
          );
          emit(
            state.copyWith(
              status: VentorFindListenersStatus.loadFailure,
              isRefreshing: false,
              errorMessage: message,
            ),
          );
        },
        (page) {
          emit(
            state.copyWith(
              status: VentorFindListenersStatus.ready,
              isRefreshing: false,
              listeners: [
                for (final item in page.items)
                  ventorFindListenerFromDomain(item),
              ],
              total: page.total,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorFindListenersBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorFindListenersStatus.loadFailure,
          isRefreshing: false,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _onFavoriteToggled(
    _FavoriteToggled event,
    Emitter<VentorFindListenersState> emit,
  ) async {
    final listenerId = event.listenerId.trim();
    if (listenerId.isEmpty || state.favoriteUpdatingIds.contains(listenerId)) {
      return;
    }

    VentorFindListener? current;
    for (final listener in state.listeners) {
      if (listener.id == listenerId) {
        current = listener;
        break;
      }
    }
    if (current == null) return;

    final nextFavorite = !current.isFavorite;
    final previousListeners = state.listeners;

    emit(
      state.copyWith(
        listeners: [
          for (final listener in state.listeners)
            if (listener.id == listenerId)
              listener.copyWith(isFavorite: nextFavorite)
            else
              listener,
        ],
        favoriteUpdatingIds: {...state.favoriteUpdatingIds, listenerId},
        favoriteErrorMessage: '',
      ),
    );

    try {
      final result = nextFavorite
          ? await _addVentorFavoriteListenerUsecase(
              listenerId: listenerId,
            ).run()
          : await _removeVentorFavoriteListenerUsecase(
              listenerId: listenerId,
            ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message:
                'VentorFindListenersBloc: favorite toggle failed — $message',
          );
          emit(
            state.copyWith(
              listeners: previousListeners,
              favoriteUpdatingIds: {
                for (final id in state.favoriteUpdatingIds)
                  if (id != listenerId) id,
              },
              favoriteErrorMessage: message,
            ),
          );
        },
        (_) {
          emit(
            state.copyWith(
              favoriteUpdatingIds: {
                for (final id in state.favoriteUpdatingIds)
                  if (id != listenerId) id,
              },
              favoriteErrorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorFindListenersBloc: unexpected favorite toggle error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          listeners: previousListeners,
          favoriteUpdatingIds: {
            for (final id in state.favoriteUpdatingIds)
              if (id != listenerId) id,
          },
          favoriteErrorMessage: _mapError(error),
        ),
      );
    }
  }

  String _mapError(Object error) {
    if (error is MainAPIException) {
      if (error.message.isNotEmpty) return error.message;
      final localized = error.getLocalizedMessage();
      if (localized.isNotEmpty) return localized;
    }
    final message = error.toString().trim();
    if (message.isNotEmpty) return message;
    return VentingMobLocalizationsHolder.withLocale(
      VentingMobLocalizationsHolder.currentLanguageCode,
      (l10n) => l10n.common_unknown_error,
    );
  }
}
