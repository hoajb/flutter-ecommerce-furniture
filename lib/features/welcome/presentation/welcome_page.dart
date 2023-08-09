import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/config/routes/routes.dart';
import 'package:flutter_ecommerce_furniture/core/wigets/action_button.dart';

import '../../../config/theme/theme_toggle_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Flutter Furniture!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ActionButton(
                matchParentWidth: true,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                },
                text: 'Login',
              ),
              const SizedBox(height: 10),
              ActionButton(
                matchParentWidth: true,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.register);
                },
                text: 'Register',
              ),
              const ModeToggleButton()
            ],
          ),
        ),
      ),
    );
  }
}
