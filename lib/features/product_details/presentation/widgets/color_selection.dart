import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/utils/invert_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/wigets/circle_background_widget.dart';

class ColorSelection extends StatefulWidget {
  final List<Color> listColors;

  const ColorSelection({super.key, required this.listColors});

  @override
  State<ColorSelection> createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  int _indexChecked = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...widget.listColors.asMap().entries.map((entry) => ColorItem(
              color: entry.value,
              isChecked: entry.key == _indexChecked,
              onChecked: () {
                setState(() {
                  _indexChecked = entry.key;
                });
              },
            ))
      ],
    );
  }
}

class ColorItem extends StatefulWidget {
  final Color color;
  final bool isChecked;
  final VoidCallback onChecked;

  const ColorItem(
      {super.key,
      required this.color,
      required this.isChecked,
      required this.onChecked});

  @override
  State<ColorItem> createState() => _ColorItemState();
}

class _ColorItemState extends State<ColorItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onChecked,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: CircularBackgroundWidget(
          size: 36,
          backgroundColor: widget.color,
          child: widget.isChecked
              ? FaIcon(
                  FontAwesomeIcons.check,
                  color: ColorUtils.invertColor(widget.color),
                  size: 18,
                )
              : null,
        ),
      ),
    );
  }
}
