import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';

import '../../../config/theme/styles.dart';

List<String> _listHomeFilterSelection = [
  'All',
  'Sofa',
  'Chair',
  'Table',
  'Kitchen',
  'Lamp',
  'Cupboard',
  'Vase',
  'Others'
];

class HomeFilterSelection extends StatefulWidget {
  const HomeFilterSelection({super.key});

  @override
  State<HomeFilterSelection> createState() => _HomeFilterSelectionState();
}

class _HomeFilterSelectionState extends State<HomeFilterSelection> {
  final List<String> _listSelectedFilter = [];

  void _toggleFilter(String filter) {
    setState(() {
      if (_listSelectedFilter.contains(filter)) {
        _listSelectedFilter.remove(filter);
      } else {
        _listSelectedFilter.add(filter);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ..._listHomeFilterSelection.map((title) => _buildItem(context, title))
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title) {
    final isDark = context.isDarkModeEnabled;
    final isSelected = _listSelectedFilter.contains(title);
    return GestureDetector(
      onTap: () => _toggleFilter(title),
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          height: 35,
          width: 80,
          decoration: BoxDecoration(
            color: isSelected
                ? (isDark ? Styles.itemColorBgDark : Styles.blackColor)
                : (isDark ? Styles.blackColor : Styles.whiteColor),
            border: Border.all(
              color:
              isDark ? Styles.itemColorBgDark : Styles.itemColorBgLight,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: isSelected
                    ? (isDark ? Styles.whiteColor : Styles.whiteColor)
                    : (isDark ? Styles.whiteColor : Styles.blackColor)),
          )),
        ),
      ),
    );
  }
}
