import 'package:flutter/material.dart';

const String mockDescriptionText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

List<Color> listProductColors =
    listProductColorsMap.entries.map((e) => e.value).toList();

const Map<String, Color> listProductColorsMap = {
  'Black': Colors.black,
  'White': Colors.white,
  'Grey': Colors.grey,
  'Garnet': Color(0xff763838),
  'Cyan': Color(0xffab8d22),
  'Blue': Color(0xff0e308d),
};
