import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';


const _height = 50.0;

const Color _textFieldBackgroundLight = Color(0xffffffff);
const Color _textFieldBackgroundDark = Color(0xff202229);
const Color _borderColorDark = Color(0xff2f3238);
const Color _borderColorLight = Color(0xfff5f6f6);

class AuthButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundC = context.isDarkModeEnabled
        ? _textFieldBackgroundDark
        : _textFieldBackgroundLight;

    return SizedBox(
      width: _height * 3 / 2,
      height: _height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundC,
          elevation: 0,
          side: BorderSide(
              color: context.isDarkModeEnabled
                  ? _borderColorDark
                  : _borderColorLight,
              width: 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: child,
      ),
    );
  }
}
