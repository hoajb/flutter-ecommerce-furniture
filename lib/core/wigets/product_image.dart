import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/config/theme/styles.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';

class ProductImage extends StatelessWidget {
  final double size;
  final String path;

  const ProductImage({super.key, this.size = 100, required this.path});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkModeEnabled;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isDark ? Styles.itemColorBgDark : Styles.itemColorBgLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          path,
        ),
      ),
    );
  }
}
