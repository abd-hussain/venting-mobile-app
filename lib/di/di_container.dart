import 'package:get_it/get_it.dart';

final diContainer = GetIt.instance;

extension GetItExtension on GetIt {
  T call<T extends Object>() => get<T>();
}
