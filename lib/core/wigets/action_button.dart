import 'package:flutter/material.dart';

const double buttonHeightDefault = 50.0;

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool matchParentWidth;
  final double height;

  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.matchParentWidth = false,
    this.height = buttonHeightDefault,
  });

  @override
  Widget build(BuildContext context) {
    bool darkModeEnabled = Theme.of(context).brightness == Brightness.dark;
    final backgroundC =
        backgroundColor ?? (darkModeEnabled ? Colors.white : Colors.black);

    final textC = textColor ?? (darkModeEnabled ? Colors.black : Colors.white);
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: matchParentWidth ? double.infinity : null,
        height: height,
        decoration: BoxDecoration(
            color: backgroundC,
            borderRadius: BorderRadius.all(Radius.circular(height / 2))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textC, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
