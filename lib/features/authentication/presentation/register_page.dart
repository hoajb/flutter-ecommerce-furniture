import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/config/routes/routes.dart';
import 'package:flutter_ecommerce_furniture/core/wigets/action_button.dart';
import 'package:flutter_ecommerce_furniture/core/wigets/text_field_custom.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

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
              'Create Your Account',
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
            ActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.home);
              },
              matchParentWidth: true,
              text: 'Register',
            )
          ],
        ),
      ),
    );
  }
}
