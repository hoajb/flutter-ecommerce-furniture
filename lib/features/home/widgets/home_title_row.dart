import 'package:flutter/material.dart';

class HomeTitleRow extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onActionPressed;

  const HomeTitleRow(
      {super.key,
      required this.title,
      required this.actionText,
      required this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onActionPressed,
            child: Text(
              actionText,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
