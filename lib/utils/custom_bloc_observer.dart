import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger_manager/logger_manager.dart';

/// Global [BlocObserver] for logging bloc lifecycle, events, state changes,
/// and errors. Set via [Bloc.observer] at app startup.
class CustomBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    LoggerManagerBase.logInfo(message: 'Bloc created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    LoggerManagerBase.logInfo(
      message: 'Bloc event: ${bloc.runtimeType} -> $event',
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    LoggerManagerBase.logInfo(
      message:
          'Bloc change: ${bloc.runtimeType} | current: ${change.currentState} | next: ${change.nextState}',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    LoggerManagerBase.logErrorMessage(
      message: 'Bloc error: ${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    LoggerManagerBase.logInfo(message: 'Bloc closed: ${bloc.runtimeType}');
  }
}
