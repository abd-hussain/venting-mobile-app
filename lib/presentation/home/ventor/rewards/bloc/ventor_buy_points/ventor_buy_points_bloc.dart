import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_point_packages.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_ventor_point_packages_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/purchase_ventor_points_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'ventor_buy_points_bloc.freezed.dart';
part 'ventor_buy_points_event.dart';
part 'ventor_buy_points_state.dart';

class VentorBuyPointsBloc
    extends Bloc<VentorBuyPointsEvent, VentorBuyPointsState> {
  VentorBuyPointsBloc(
    this._getVentorPointPackagesUsecase,
    this._purchaseVentorPointsUsecase,
  ) : super(const VentorBuyPointsState()) {
    on<_Started>(_onStarted);
    on<_RetryLoad>(_onRetryLoad);
    on<_PurchaseRequested>(_onPurchaseRequested);
  }

  final GetVentorPointPackagesUsecase _getVentorPointPackagesUsecase;
  final PurchaseVentorPointsUsecase _purchaseVentorPointsUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<VentorBuyPointsState> emit,
  ) async {
    await _loadPackages(emit);
  }

  Future<void> _onRetryLoad(
    _RetryLoad event,
    Emitter<VentorBuyPointsState> emit,
  ) async {
    await _loadPackages(emit);
  }

  Future<void> _onPurchaseRequested(
    _PurchaseRequested event,
    Emitter<VentorBuyPointsState> emit,
  ) async {
    if (state.isPurchasing) return;

    emit(
      state.copyWith(
        isPurchasing: true,
        purchaseErrorMessage: '',
        purchaseSuccess: false,
      ),
    );

    try {
      final result = await _purchaseVentorPointsUsecase(
        packageId: event.packageId,
      ).run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorBuyPointsBloc: purchase failed — $message',
          );
          emit(
            state.copyWith(isPurchasing: false, purchaseErrorMessage: message),
          );
        },
        (purchaseResult) {
          emit(
            state.copyWith(
              isPurchasing: false,
              purchaseErrorMessage: '',
              purchaseSuccess: true,
              purchaseResult: purchaseResult,
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorBuyPointsBloc: unexpected purchase error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          isPurchasing: false,
          purchaseErrorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _loadPackages(Emitter<VentorBuyPointsState> emit) async {
    emit(
      state.copyWith(
        status: VentorBuyPointsStatus.loading,
        errorMessage: '',
        purchaseSuccess: false,
        purchaseResult: null,
      ),
    );

    try {
      final result = await _getVentorPointPackagesUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'VentorBuyPointsBloc: load failed — $message',
          );
          emit(
            state.copyWith(
              status: VentorBuyPointsStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (packages) {
          emit(
            state.copyWith(
              status: VentorBuyPointsStatus.ready,
              packages: packages,
              errorMessage: '',
            ),
          );
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'VentorBuyPointsBloc: unexpected load error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: VentorBuyPointsStatus.loadFailure,
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
