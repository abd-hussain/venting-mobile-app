import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_boundary_model.freezed.dart';

@freezed
abstract class CatalogBoundariesResponseModel
    with _$CatalogBoundariesResponseModel {
  const factory CatalogBoundariesResponseModel({
    required String status,
    required CatalogBoundariesData data,
  }) = _CatalogBoundariesResponseModel;

  factory CatalogBoundariesResponseModel.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];
    final List<CatalogBoundaryModel> items;

    if (rawData is List) {
      items = rawData
          .whereType<Map<String, dynamic>>()
          .map(CatalogBoundaryModel.fromJson)
          .toList(growable: false);
    } else if (rawData is Map<String, dynamic>) {
      items = CatalogBoundariesData.fromJson(rawData).items;
    } else {
      items = const [];
    }

    return CatalogBoundariesResponseModel(
      status: json['status'] as String? ?? 'success',
      data: CatalogBoundariesData(items: items),
    );
  }
}

@freezed
abstract class CatalogBoundariesData with _$CatalogBoundariesData {
  const factory CatalogBoundariesData({
    @Default(<CatalogBoundaryModel>[]) List<CatalogBoundaryModel> items,
  }) = _CatalogBoundariesData;

  factory CatalogBoundariesData.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
    if (rawItems is List) {
      return CatalogBoundariesData(
        items: rawItems
            .whereType<Map<String, dynamic>>()
            .map(CatalogBoundaryModel.fromJson)
            .toList(growable: false),
      );
    }
    return const CatalogBoundariesData();
  }
}

@freezed
abstract class CatalogBoundaryModel with _$CatalogBoundaryModel {
  const factory CatalogBoundaryModel({
    required String id,
    required String name_en,
    required String name_ar,
    @Default('') String icon_emoji,
    @Default('') String icon_url,
    @Default(0) int sort_order,
    @Default(false) bool allows_custom_text,
  }) = _CatalogBoundaryModel;

  factory CatalogBoundaryModel.fromJson(Map<String, dynamic> json) {
    final iconUrl = (json['icon_url'] ?? json['image_url'])?.toString() ?? '';

    return CatalogBoundaryModel(
      id: json['id'] as String,
      name_en: json['name_en'] as String,
      name_ar: json['name_ar'] as String,
      icon_emoji: json['icon_emoji'] as String? ?? '',
      icon_url: iconUrl,
      sort_order: (json['sort_order'] as num?)?.toInt() ?? 0,
      allows_custom_text: json['allows_custom_text'] as bool? ?? false,
    );
  }
}
