import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';

import '../../config/theme/styles.dart';

const _borderRadius = 12.0;

_boxDecoration(BuildContext context, FocusNode focusNode) {
  return BoxDecoration(
    color: context.isDarkModeEnabled
        ? Styles.textFieldBackgroundDark
        : Styles.textFieldBackgroundLight,
    border: Border.all(
      color: focusNode.hasFocus ? Colors.grey : Colors.transparent,
    ),
    borderRadius: BorderRadius.circular(_borderRadius),
  );
}

const _padding = EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0);

class TextFieldWithIcon extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;

  final FocusNode _focusNode = FocusNode();

  TextFieldWithIcon({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: _padding,
      decoration: _boxDecoration(context, _focusNode),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              obscureText: obscureText,
              focusNode: _focusNode,
              decoration: InputDecoration.collapsed(
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldWithIconObscureText extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const TextFieldWithIconObscureText({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
    this.onChanged,
  });

  @override
  State<TextFieldWithIconObscureText> createState() =>
      _TextFieldWithIconObscureTextState();
}

class _TextFieldWithIconObscureTextState
    extends State<TextFieldWithIconObscureText> {
  bool _obscureText = true;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: _padding,
      decoration: _boxDecoration(context, _focusNode),
      child: Row(
        children: [
          Icon(widget.icon),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              obscureText: _obscureText,
              focusNode: _focusNode,
              decoration: InputDecoration.collapsed(
                hintText: widget.hintText,
              ),
            ),
          ),
          GestureDetector(
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ],
      ),
    );
  }
}
