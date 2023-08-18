import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/config/routes/routes.dart';
import 'package:flutter_ecommerce_furniture/core/wigets/action_button.dart';

import '../../../config/theme/theme_toggle_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionButton(
            text: "Log out",
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.onboarding,
                    (Route<dynamic> route) => false,
              );
            }),
        const SizedBox(
          height: 10,
        ),
        const ModeToggleButton()
      ],
    );
  }
}
