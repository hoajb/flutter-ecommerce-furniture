import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config/theme/styles.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const HomeSearchBar({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkModeEnabled;
    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: context.isDarkModeEnabled
            ? Styles.textFieldBackgroundDark
            : Styles.textFieldBackgroundLight,
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            size: 18,
            color: isDark ? Colors.white : Colors.grey,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: const InputDecoration.collapsed(
                hintText: 'Search',
              ),
            ),
          ),
          const SizedBox(width: 8),
          FaIcon(
            FontAwesomeIcons.sliders,
            size: 18,
            color: isDark ? Colors.white : Colors.grey,
          ),
        ],
      ),
    );
  }
}
