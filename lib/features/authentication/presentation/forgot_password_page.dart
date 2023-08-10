import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/wigets/action_button.dart';
import '../../../core/wigets/text_field_custom.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController _controllerUsername = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              ActionButton(
                matchParentWidth: true,
                onPressed: () {
                  // Perform password reset
                },
                text: 'Reset Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
