import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';

import '../../../config/theme/styles.dart';

class FilterSingleSelection<T> extends StatefulWidget {
  final ValueChanged<T>? onValueChanged;
  final List<T> listFilter;
  final Widget? Function(BuildContext context, T item) itemBuilder;

  const FilterSingleSelection({
    super.key,
    this.onValueChanged,
    required this.listFilter,
    required this.itemBuilder,
  });

  @override
  State<FilterSingleSelection> createState() => _FilterSingleSelectionState();
}

class _FilterSingleSelectionState<T> extends State<FilterSingleSelection> {
  final List<T> _listSelectedFilter = [];

  void _selectFilter(T filter) {
    setState(() {
      if (_listSelectedFilter.contains(filter)) {
        return;
      }

      _listSelectedFilter.clear();
      _listSelectedFilter.add(filter);
      widget.onValueChanged?.call(filter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...widget.listFilter.map((title) => _buildItem(context, title))
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, T item) {
    final isDark = context.isDarkModeEnabled;
    final isSelected = _listSelectedFilter.contains(item);
    return GestureDetector(
      onTap: () => _selectFilter(item),
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          height: 35,
          constraints: const BoxConstraints(minWidth: 80),
          decoration: BoxDecoration(
            color: isSelected
                ? (isDark ? Styles.itemColorBgDark : Styles.blackColor)
                : (isDark ? Styles.blackColor : Styles.whiteColor),
            border: Border.all(
              color: isDark ? Styles.itemColorBgDark : Styles.itemColorBgLight,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Builder(builder: (BuildContext context) {
              return widget.itemBuilder.call(context, item) ?? Container();
            }),
          )),
        ),
      ),
    );
  }
}
