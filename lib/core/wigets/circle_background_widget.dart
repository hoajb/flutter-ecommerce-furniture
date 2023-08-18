import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/utils/invert_color.dart';

class CircularBackgroundWidget extends StatelessWidget {
  final Widget? child;
  final Color backgroundColor;
  final double size;

  const CircularBackgroundWidget({
    super.key,
    required this.child,
    required this.backgroundColor,
    this.size = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorUtils.invertColor(backgroundColor),
          width: 2.0,
        ),
        color: backgroundColor,
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
