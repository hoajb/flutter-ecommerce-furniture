import 'package:flutter_ecommerce_furniture/generated/json/base/json_convert_content.dart';
import 'package:flutter_ecommerce_furniture/features/home/data/banner_entity.dart';

BannerEntity $BannerDataEntityFromJson(Map<String, dynamic> json) {
  final BannerEntity bannerDataEntity = BannerEntity();
  final String? assetProductImage = jsonConvert.convert<String>(
      json['assetProductImage']);
  if (assetProductImage != null) {
    bannerDataEntity.assetProductImage = assetProductImage;
  }
  final String? discount = jsonConvert.convert<String>(json['discount']);
  if (discount != null) {
    bannerDataEntity.discount = discount;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    bannerDataEntity.title = title;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    bannerDataEntity.message = message;
  }
  return bannerDataEntity;
}

Map<String, dynamic> $BannerDataEntityToJson(BannerEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['assetProductImage'] = entity.assetProductImage;
  data['discount'] = entity.discount;
  data['title'] = entity.title;
  data['message'] = entity.message;
  return data;
}