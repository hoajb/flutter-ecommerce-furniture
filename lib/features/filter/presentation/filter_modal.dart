import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';
import 'package:flutter_ecommerce_furniture/features/home/data/mock_home_filters.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../config/theme/styles.dart';
import '../../home/widgets/filter_multi_selection.dart';
import '../data/mock_sort_by.dart';
import '../widgets/filte_selection.dart';

class FilterModal extends StatelessWidget {
  const FilterModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Sort and Filter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          const Divider(),
          const SizedBox(height: 16),
          const Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          HomeFilterSelection(
            listFilter: listHomeFilterSelection,
          ),
          const SizedBox(height: 16),
          const Text(
            'Price Range',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const RangeSlider(),
          const SizedBox(height: 16),
          const Text(
            'Sort by',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          HomeFilterSelection(
            listFilter: listSortByFilterSelection,
          ),
          const SizedBox(height: 16),
          const Text(
            'Rating',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          const RatingStar(),
        ],
      ),
    );
  }
}

class RatingStar extends StatefulWidget {
  const RatingStar({
    super.key,
  });

  @override
  State<RatingStar> createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  String _currentStar = '';

  @override
  Widget build(BuildContext context) {
    return FilterSingleSelection<String>(
      listFilter: const ['All', '1', '2', '3', '4', '5'],
      onValueChanged: (dynamic value) {
        setState(() {
          _currentStar = value.toString();
        });
      },
      itemBuilder: (BuildContext context, dynamic item) {
        final isSelected = _currentStar == item.toString();
        final isDark = context.isDarkModeEnabled;
        return Row(
          children: [
            FaIcon(
                isSelected ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                size: 14,
                color: isSelected
                    ? Styles.whiteColor
                    : (isDark ? Styles.whiteColor : Styles.blackColor)),
            const SizedBox(width: 8),
            Text(item,
                style: TextStyle(
                    fontSize: 14,
                    color: isSelected
                        ? Styles.whiteColor
                        : (isDark ? Styles.whiteColor : Styles.blackColor)))
          ],
        );
      },
    );
  }
}

class RangeSlider extends StatefulWidget {
  const RangeSlider({super.key});

  @override
  State<RangeSlider> createState() => _RangeSliderState();
}

class _RangeSliderState extends State<RangeSlider> {
  SfRangeValues _values = const SfRangeValues(0.0, 500.0);

  @override
  Widget build(BuildContext context) {
    return SfRangeSlider(
      min: 0.0,
      max: 500.0,
      values: _values,
      interval: 40,
      showTicks: true,
      showLabels: false,
      enableTooltip: true,
      shouldAlwaysShowTooltip: false,
      minorTicksPerInterval: 1,
      stepSize: 20,
      numberFormat: NumberFormat("\$"),
      tooltipShape: const SfPaddleTooltipShape(),
      onChanged: (SfRangeValues values) {
        setState(() {
          _values = values;
        });
      },
    );
  }
}
