import 'package:flutter/material.dart';

String mockDescriptionText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

List<Color> listProductColors =
    listProductColorsMap.entries.map((e) => e.value).toList();

Map<String, Color> listProductColorsMap = {
  'Black': Colors.black,
  'White': Colors.white,
  'Grey': Colors.grey,
  'Garnet': const Color(0xff763838),
  'Cyan': const Color(0xffab8d22),
  'Blue': const Color(0xff0e308d),
};
