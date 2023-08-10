import 'package:flutter/material.dart';

class CheckboxApp extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CheckboxApp({
    super.key,
    this.value = false,
    this.onChanged,
  });

  @override
  _CheckboxAppState createState() => _CheckboxAppState();
}

class _CheckboxAppState extends State<CheckboxApp> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          if (widget.onChanged != null) {
            widget.onChanged!(_isChecked);
          }
        });
      },
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          color: _isChecked ? Colors.black : Colors.white,
          border: Border.all(
            color: _isChecked ? Colors.white : Colors.black,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: _isChecked
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 16.0,
              )
            : null,
      ),
    );
  }
}
