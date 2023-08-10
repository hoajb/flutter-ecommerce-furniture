import 'package:flutter_ecommerce_furniture/generated/json/base/json_field.dart';
import 'package:flutter_ecommerce_furniture/generated/json/banner_data_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class BannerEntity {
  late String assetProductImage;
  late String discount = '';
  late String title = '';
  late String message = '';

  BannerEntity({
    this.assetProductImage = '',
    this.discount = '',
    this.title = '',
    this.message = '',
  });

  factory BannerEntity.fromJson(Map<String, dynamic> json) =>
      $BannerDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $BannerDataEntityToJson(this);

  BannerEntity copyWith(
      {String? assetProductImage,
      String? discount,
      String? title,
      String? message}) {
    return BannerEntity()
      ..assetProductImage = assetProductImage ?? this.assetProductImage
      ..discount = discount ?? this.discount
      ..title = title ?? this.title
      ..message = message ?? this.message;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
