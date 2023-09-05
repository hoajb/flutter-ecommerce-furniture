import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/config/theme/styles.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';

const _imageSize = 150.0;
const _borderRadius = 20.0;

class ProductImage extends StatelessWidget {
  final double size;
  final double borderRadius;
  final String path;

  const ProductImage({
    super.key,
    this.size = _imageSize,
    this.borderRadius = _borderRadius,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkModeEnabled;
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: isDark ? Styles.itemColorBgDark : Styles.itemColorBgLight,
          width: size,
          height: size,
          child: Image.asset(
            path,
          ),
        ));
  }
}
