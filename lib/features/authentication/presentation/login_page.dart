import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/config/routes/routes.dart';
import 'package:flutter_ecommerce_furniture/config/theme/styles.dart';
import 'package:flutter_ecommerce_furniture/core/wigets/action_button.dart';

import '../../../core/wigets/checkbox_custom.dart';
import '../../../core/wigets/text_field_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerUsername = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  bool _isCheckedRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo_furniture.jpeg',
              width: 180,
              height: 180,
            ),
            const SizedBox(height: 20),
            const Text(
              'Login to Your Account',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            TextFieldWithIcon(
              icon: Icons.email,
              hintText: 'Email',
              controller: _controllerUsername,
              onChanged: (value) {
                if (kDebugMode) {
                  print('Username changed: $value');
                }
              },
            ),
            const SizedBox(height: 20),
            TextFieldWithIconObscureText(
              icon: Icons.lock,
              hintText: 'Password',
              controller: _controllerPassword,
              onChanged: (value) {
                if (kDebugMode) {
                  print('Password changed: $value');
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CheckboxApp(
                    value: _isCheckedRememberMe,
                    onChanged: (isChecked) {
                      setState(() {
                        _isCheckedRememberMe = isChecked;
                      });
                      if (kDebugMode) {
                        print('Remember me checked: $isChecked');
                      }
                    }),
                const SizedBox(width: 10),
                const Text('Remember me'),
              ],
            ),
            const SizedBox(height: 30),
            ActionButton(
              matchParentWidth: true,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.home);
              },
              text: 'Login',
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.forgotPassword);
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
