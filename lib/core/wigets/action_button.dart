import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool matchParentWidth;

  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.matchParentWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    bool darkModeEnabled = Theme.of(context).brightness == Brightness.dark;
    final backgroundC =
        backgroundColor ?? (darkModeEnabled ? Colors.white : Colors.black);

    final textC = textColor ?? (darkModeEnabled ? Colors.black : Colors.white);
    return SizedBox(
      width: matchParentWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundC,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textC, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
