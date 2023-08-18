import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/theme/styles.dart';

const _height = 40.0;

class NumberSelection extends StatefulWidget {
  final ValueChanged<int>? onChanged;

  const NumberSelection({super.key, this.onChanged});

  @override
  State<NumberSelection> createState() => _NumberSelectionState();
}

class _NumberSelectionState extends State<NumberSelection> {
  int _number = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Styles.itemColorBgLight,
        borderRadius: BorderRadius.circular(_height / 2),
      ),
      height: _height,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (_number > 1) {
                    _number--;
                  }

                  widget.onChanged?.call(_number);
                });
              },
              icon: const FaIcon(
                FontAwesomeIcons.minus,
                color: Styles.blackColor,
                size: 14,
              )),
          const SizedBox(width: 8),
          SizedBox(
            width: 40,
            child: Center(
              child: Text(
                '$_number',
                style: const TextStyle(color: Styles.blackColor, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
              onPressed: () {
                setState(() {
                  if (_number < 10) {
                    _number++;
                  }
                  widget.onChanged?.call(_number);
                });
              },
              icon: const FaIcon(
                FontAwesomeIcons.plus,
                color: Styles.blackColor,
                size: 14,
              )),
        ],
      ),
    );
  }
}
