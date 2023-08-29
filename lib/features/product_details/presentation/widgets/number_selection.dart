import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/theme/styles.dart';

const _heightDefault = 40.0;
const _numberSizeDefault = 18.0;
const _iconSizeDefault = 18.0;

class NumberSelection extends StatefulWidget {
  final ValueChanged<int>? onChanged;
  final int numberInitial;
  final double height;
  final double numberSize;
  final double iconSize;

  const NumberSelection({
    super.key,
    this.onChanged,
    this.numberInitial = 1,
    this.height = _heightDefault,
    this.numberSize = _numberSizeDefault,
    this.iconSize = _iconSizeDefault,
  });

  @override
  State<NumberSelection> createState() => _NumberSelectionState();
}

class _NumberSelectionState extends State<NumberSelection> {
  late int _number;

  @override
  void initState() {
    super.initState();
    _number = widget.numberInitial;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widget.iconSize),
      decoration: BoxDecoration(
        color: Styles.itemColorBgLight,
        borderRadius: BorderRadius.circular(_heightDefault / 2),
      ),
      height: widget.height,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
              onTap: () {
                setState(() {
                  if (_number > 1) {
                    _number--;
                  }

                  widget.onChanged?.call(_number);
                });
              },
              child: Padding(
                padding: EdgeInsets.all((widget.height - widget.iconSize) / 2),
                child: FaIcon(
                  FontAwesomeIcons.minus,
                  color: Styles.blackColor,
                  size: widget.iconSize,
                ),
              )),
          SizedBox(
            width: 40,
            child: Center(
              child: Text(
                '$_number',
                style: TextStyle(
                    color: Styles.blackColor, fontSize: widget.numberSize),
              ),
            ),
          ),
          InkWell(
              onTap: () {
                setState(() {
                  if (_number < 10) {
                    _number++;
                  }
                  widget.onChanged?.call(_number);
                });
              },
              child: Padding(
                padding: EdgeInsets.all((widget.height - widget.iconSize) / 2),
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  color: Styles.blackColor,
                  size: widget.iconSize,
                ),
              )),
        ],
      ),
    );
  }
}
