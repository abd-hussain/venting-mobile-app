import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/app/listener_profile.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_profile_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_listener_reviews_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_about_me_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_avatar_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_profile_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/update_listener_voice_intro_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'listener_profile_bloc.freezed.dart';
part 'listener_profile_event.dart';
part 'listener_profile_state.dart';

class ListenerProfileBloc
    extends Bloc<ListenerProfileEvent, ListenerProfileState> {
  ListenerProfileBloc(
    this._getListenerProfileUsecase,
    this._getListenerReviewsUsecase,
    this._updateListenerAvatarUsecase,
    this._updateListenerAboutMeUsecase,
    this._updateListenerVoiceIntroUsecase,
    this._updateListenerProfileUsecase,
  ) : super(const ListenerProfileState()) {
    on<_Started>(_onStarted);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_AvatarUpdateRequested>(_onAvatarUpdateRequested);
    on<_AboutMeUpdateRequested>(_onAboutMeUpdateRequested);
    on<_VoiceIntroUpdateRequested>(_onVoiceIntroUpdateRequested);
    on<_ProfileFieldsUpdateRequested>(_onProfileFieldsUpdateRequested);
  }

  final GetListenerProfileUsecase _getListenerProfileUsecase;
  final GetListenerReviewsUsecase _getListenerReviewsUsecase;
  final UpdateListenerAvatarUsecase _updateListenerAvatarUsecase;
  final UpdateListenerAboutMeUsecase _updateListenerAboutMeUsecase;
  final UpdateListenerVoiceIntroUsecase _updateListenerVoiceIntroUsecase;
  final UpdateListenerProfileUsecase _updateListenerProfileUsecase;

  Future<void> _onStarted(
    _Started event,
    Emitter<ListenerProfileState> emit,
  ) async {
    if (state.isLoading || state.isRefreshing) return;
    if (state.profile != null && !state.isLoadFailure) return;
    await _loadProfile(emit, showLoading: true);
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<ListenerProfileState> emit,
  ) async {
    await _loadProfile(emit, showLoading: state.profile == null);
  }

  Future<void> _onAvatarUpdateRequested(
    _AvatarUpdateRequested event,
    Emitter<ListenerProfileState> emit,
  ) async {
    if (state.isUploadingAvatar) return;

    emit(
      state.copyWith(
        isUploadingAvatar: true,
        pendingAvatarFilePath: event.avatarFilePath,
        updateErrorMessage: '',
      ),
    );

    await _runProfileUpdate(
      emit,
      update: () => _updateListenerAvatarUsecase(
        avatarFilePath: event.avatarFilePath,
      ).run(),
      onFailureClear: () =>
          state.copyWith(isUploadingAvatar: false, pendingAvatarFilePath: null),
      logLabel: 'update avatar',
    );
  }

  Future<void> _onAboutMeUpdateRequested(
    _AboutMeUpdateRequested event,
    Emitter<ListenerProfileState> emit,
  ) async {
    if (state.isSavingAboutMe) return;

    emit(state.copyWith(isSavingAboutMe: true, updateErrorMessage: ''));

    await _runProfileUpdate(
      emit,
      update: () => _updateListenerAboutMeUsecase(aboutMe: event.aboutMe).run(),
      onFailureClear: () => state.copyWith(isSavingAboutMe: false),
      logLabel: 'update about me',
    );
  }

  Future<void> _onVoiceIntroUpdateRequested(
    _VoiceIntroUpdateRequested event,
    Emitter<ListenerProfileState> emit,
  ) async {
    if (state.isUploadingVoiceIntro) return;

    emit(
      state.copyWith(
        isUploadingVoiceIntro: true,
        pendingVoiceFilePath: event.voiceFilePath,
        pendingVoiceDurationSeconds: event.durationSeconds,
        updateErrorMessage: '',
      ),
    );

    await _runProfileUpdate(
      emit,
      update: () => _updateListenerVoiceIntroUsecase(
        voiceFilePath: event.voiceFilePath,
        durationSeconds: event.durationSeconds,
      ).run(),
      onFailureClear: () => state.copyWith(
        isUploadingVoiceIntro: false,
        pendingVoiceFilePath: null,
        pendingVoiceDurationSeconds: null,
      ),
      logLabel: 'update voice intro',
    );
  }

  Future<void> _onProfileFieldsUpdateRequested(
    _ProfileFieldsUpdateRequested event,
    Emitter<ListenerProfileState> emit,
  ) async {
    if (state.savingProfileField != null) return;

    emit(
      state.copyWith(savingProfileField: event.target, updateErrorMessage: ''),
    );

    await _runProfileUpdate(
      emit,
      update: () => _updateListenerProfileUsecase(fields: event.fields).run(),
      onFailureClear: () => state.copyWith(savingProfileField: null),
      logLabel: 'update profile fields',
    );
  }

  Future<void> _runProfileUpdate(
    Emitter<ListenerProfileState> emit, {
    required Future<dynamic> Function() update,
    required ListenerProfileState Function() onFailureClear,
    required String logLabel,
  }) async {
    try {
      final result = await update();
      if (emit.isDone) return;

      await result.match(
        (Object error) async {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerProfileBloc: $logLabel failed — $message',
          );
          emit(onFailureClear().copyWith(updateErrorMessage: message));
        },
        (ListenerProfile profile) async {
          await _emitRefreshedProfile(emit, fallbackProfile: profile);
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerProfileBloc: unexpected $logLabel error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(onFailureClear().copyWith(updateErrorMessage: _mapError(error)));
    }
  }

  Future<void> _emitRefreshedProfile(
    Emitter<ListenerProfileState> emit, {
    ListenerProfile? fallbackProfile,
  }) async {
    final refreshed = await _getListenerProfileUsecase().run();
    if (emit.isDone) return;

    refreshed.match(
      (error) {
        if (fallbackProfile != null) {
          emit(
            state.copyWith(
              status: ListenerProfileStatus.ready,
              profile: fallbackProfile,
              isUploadingAvatar: false,
              isSavingAboutMe: false,
              savingProfileField: null,
              isUploadingVoiceIntro: false,
              pendingAvatarFilePath: null,
              pendingVoiceFilePath: null,
              pendingVoiceDurationSeconds: null,
              updateErrorMessage: '',
            ),
          );
          return;
        }

        emit(
          state.copyWith(
            updateErrorMessage: _mapError(error),
            isUploadingAvatar: false,
            isSavingAboutMe: false,
            savingProfileField: null,
            isUploadingVoiceIntro: false,
            pendingAvatarFilePath: null,
            pendingVoiceFilePath: null,
            pendingVoiceDurationSeconds: null,
          ),
        );
      },
      (updatedProfile) {
        final profile = fallbackProfile == null
            ? updatedProfile
            : mergeProfileAfterWrite(updatedProfile, fallbackProfile);
        final refreshedAvatar = profile.avatarUrl?.trim();
        emit(
          state.copyWith(
            status: ListenerProfileStatus.ready,
            profile: profile,
            isUploadingAvatar: false,
            isSavingAboutMe: false,
            savingProfileField: null,
            isUploadingVoiceIntro: false,
            pendingAvatarFilePath: null,
            pendingVoiceFilePath: null,
            pendingVoiceDurationSeconds: null,
            updateErrorMessage: '',
            avatarCacheToken:
                fallbackProfile != null &&
                    (refreshedAvatar?.isNotEmpty ?? false)
                ? DateTime.now().millisecondsSinceEpoch
                : state.avatarCacheToken,
          ),
        );
        unawaited(_maybeEnrichReviewDistribution(emit, profile));
      },
    );
  }

  Future<void> _loadProfile(
    Emitter<ListenerProfileState> emit, {
    required bool showLoading,
  }) async {
    if (showLoading) {
      emit(
        state.copyWith(status: ListenerProfileStatus.loading, errorMessage: ''),
      );
    } else {
      emit(
        state.copyWith(
          status: ListenerProfileStatus.refreshing,
          errorMessage: '',
        ),
      );
    }

    try {
      final result = await _getListenerProfileUsecase().run();
      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ListenerProfileBloc: load profile failed — $message',
          );
          emit(
            state.copyWith(
              status: ListenerProfileStatus.loadFailure,
              errorMessage: message,
            ),
          );
        },
        (profile) {
          emit(
            state.copyWith(
              status: ListenerProfileStatus.ready,
              profile: profile,
              errorMessage: '',
            ),
          );
          unawaited(_maybeEnrichReviewDistribution(emit, profile));
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ListenerProfileBloc: unexpected load profile error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        state.copyWith(
          status: ListenerProfileStatus.loadFailure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  Future<void> _maybeEnrichReviewDistribution(
    Emitter<ListenerProfileState> emit,
    ListenerProfile profile,
  ) async {
    if (profile.reviewCount <= 0 || profile.hasRatingDistribution) return;

    final result = await _getListenerReviewsUsecase(pageSize: 100).run();
    if (emit.isDone) return;

    result.match((_) {}, (summary) {
      final distribution = ratingDistributionFromRatings(
        summary.reviews.map((review) => review.rating),
      );
      if (!distribution.any((count) => count > 0)) return;

      final current = state.profile ?? profile;
      emit(
        state.copyWith(
          profile: current.applyReviewSummary(
            rating: summary.rating > 0 ? summary.rating : current.rating,
            reviewCount: summary.reviewCount > 0
                ? summary.reviewCount
                : current.reviewCount,
            ratingDistribution: distribution,
          ),
        ),
      );
    });
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
