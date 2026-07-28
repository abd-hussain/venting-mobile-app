import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

CacheOptions _cacheOptions({
  int maxStaleDays = 7,
  CachePriority priority = CachePriority.normal,
}) => CacheOptions(
  store: MemCacheStore(),
  maxStale: Duration(days: maxStaleDays),
  priority: priority,
);

InterceptorsWrapper interceptorWrapper(List<String> urlsToCache) =>
    InterceptorsWrapper(
      onRequest: (options, handler) {
        if (urlsToCache.any((url) => options.uri.toString().contains(url))) {
          final cacheOptions = _cacheOptions();
          options.extra = cacheOptions.toExtra();
          return handler.next(options);
        }

        return handler.next(options);
      },
    );
