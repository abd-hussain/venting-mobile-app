/// Resolves API media paths (e.g. `/static/uploads/...`) to absolute URLs.
String resolveApiAssetUrl(String? url, {required String baseUrl}) {
  final trimmed = url?.trim() ?? '';
  if (trimmed.isEmpty) return '';

  final lower = trimmed.toLowerCase();
  if (lower.startsWith('http://') || lower.startsWith('https://')) {
    return trimmed;
  }

  final normalizedBase = baseUrl.replaceAll(RegExp(r'/+$'), '');
  if (trimmed.startsWith('/')) return '$normalizedBase$trimmed';
  return '$normalizedBase/$trimmed';
}

/// Busts HTTP caches when the server reuses the same media path after an update.
String withApiAssetCacheBuster(String url, {int? cacheToken}) {
  if (url.isEmpty || cacheToken == null || cacheToken <= 0) return url;
  final separator = url.contains('?') ? '&' : '?';
  return '$url${separator}t=$cacheToken';
}
