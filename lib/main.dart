import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/config/routes/routes.dart';
import 'package:flutter_ecommerce_furniture/config/theme/app_themes.dart';
import 'package:provider/provider.dart';

import 'config/theme/styles.dart';
import 'config/theme/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ModelTheme(),
        ),
      ],
      child: Consumer<ModelTheme>(
        builder: (BuildContext context, themeObject, Widget? child) =>
            MaterialApp(
          title: 'Flutter Furniture',
          // theme: getAppTheme(context, themeObject.isDarkMode),
          theme: Styles.themeData(themeObject.isDarkMode, context),
          initialRoute: AppRoutes.onboarding,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
