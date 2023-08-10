import 'package:flutter/material.dart';

import '../../../core/wigets/header_profile.dart';
import '../widgets/home_banners.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_title_row.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const HeaderProfile(),
          const SizedBox(height: 20),
          HomeSearchBar(
            controller: _controllerSearch,
          ),
          HomeTitleRow(
            title: 'Special Offer',
            actionText: 'See All',
            onActionPressed: () {},
          ),
          const HomeBanners(),
          const Expanded(
              child: Center(child: Text('Welcome to the Home Page!'))),
        ]),
      ),
    );
  }
}
