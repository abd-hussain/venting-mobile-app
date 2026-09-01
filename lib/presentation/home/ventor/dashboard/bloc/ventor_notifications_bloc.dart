import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/listener_notification.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/delete_ventor_notification_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_notifications_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/mark_all_ventor_notifications_read_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'ventor_notifications_bloc.freezed.dart';
part 'ventor_notifications_event.dart';
part 'ventor_notifications_state.dart';

class VentorNotificationsBloc
    extends Bloc<VentorNotificationsEvent, VentorNotificationsState> {
  VentorNotificationsBloc(
    this._getVentorNotificationsUsecase,
    this._markAllVentorNotificationsReadUsecase,
    this._deleteVentorNotificationUsecase,
  ) : super(const VentorNotificationsState()) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
    on<_UnreadOnlyFilterChanged>(_onUnreadOnlyFilterChanged);
    on<_MarkAllAsReadRequested>(_onMarkAllAsReadRequested);
    on<_NotificationTapped>(_onNotificationTapped);
    on<_DeleteRequested>(_onDeleteRequested);
  }

  final GetVentorNotificationsUsecase _getVentorNotificationsUsecase;
  final MarkAllVentorNotificationsReadUsecase
  _markAllVentorNotificationsReadUsecase;
  final DeleteVentorNotificationUsecase _deleteVentorNotificationUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<VentorNotificationsState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<VentorNotificationsState> emit,
  ) async {
    await _load(emit);
  }

  Future<void> _load(Emitter<VentorNotificationsState> emit) async {
    emit(
      state.copyWith(
        status: VentorNotificationsStatus.loading,
        errorMessage: '',
      ),
    );

    try {
      final result = await _getVentorNotificationsUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorNotificationsBloc: load failed — $message',
          );
          emit(
            state.copyWith(
              status: VentorNotificationsStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (items) {
          emit(
            state.copyWith(
              status: VentorNotificationsStatus.ready,
              items: items,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorNotificationsBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorNotificationsStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  void _onUnreadOnlyFilterChanged(
    _UnreadOnlyFilterChanged event,
    Emitter<VentorNotificationsState> emit,
  ) {
    emit(state.copyWith(unreadOnly: event.unreadOnly));
  }

  Future<void> _onMarkAllAsReadRequested(
    _MarkAllAsReadRequested event,
    Emitter<VentorNotificationsState> emit,
  ) async {
    if (state.isMarkingAllAsRead || !state.hasUnread) return;

    emit(state.copyWith(isMarkingAllAsRead: true, errorMessage: ''));

    try {
      final result = await _markAllVentorNotificationsReadUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorNotificationsBloc: mark all read failed — $message',
          );
          emit(
            state.copyWith(isMarkingAllAsRead: false, errorMessage: message),
          );
        },
        (_) {
          emit(
            state.copyWith(
              isMarkingAllAsRead: false,
              items: state.items
                  .map((item) => item.copyWith(isRead: true))
                  .toList(growable: false),
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorNotificationsBloc: unexpected mark all read error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          isMarkingAllAsRead: false,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  void _onNotificationTapped(
    _NotificationTapped event,
    Emitter<VentorNotificationsState> emit,
  ) {
    final item = state.items
        .where((notification) => notification.id == event.notificationId)
        .firstOrNull;
    if (item == null || item.isRead) return;

    emit(
      state.copyWith(
        items: state.items
            .map(
              (notification) => notification.id == event.notificationId
                  ? notification.copyWith(isRead: true)
                  : notification,
            )
            .toList(growable: false),
      ),
    );
  }

  Future<void> _onDeleteRequested(
    _DeleteRequested event,
    Emitter<VentorNotificationsState> emit,
  ) async {
    if (state.deletingNotificationId != null) return;

    final previousItems = state.items;
    emit(
      state.copyWith(
        deletingNotificationId: event.notificationId,
        errorMessage: '',
        items: state.items
            .where((item) => item.id != event.notificationId)
            .toList(growable: false),
      ),
    );

    try {
      final result = await _deleteVentorNotificationUsecase(
        notificationId: event.notificationId,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorNotificationsBloc: delete failed — $message',
          );
          emit(
            state.copyWith(
              deletingNotificationId: null,
              items: previousItems,
              errorMessage: message,
            ),
          );
        },
        (_) {
          emit(state.copyWith(deletingNotificationId: null, errorMessage: ''));
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorNotificationsBloc: unexpected delete error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          deletingNotificationId: null,
          items: previousItems,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  String _mapError(Object error) {
    if (error is MainAPIException) {
      final localized = error.getLocalizedMessage();
      if (localized.isNotEmpty) return localized;
      if (error.message.isNotEmpty) return error.message;
    }
    try {
      return VentingMobLocalizationsHolder.current.common_unknown_error;
    } on Object {
      return 'Something went wrong. Please try again.';
    }
  }
}
