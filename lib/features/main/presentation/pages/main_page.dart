import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/theme/styles.dart';
import '../../../home/presentation/home_page.dart';
import 'example_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkModeEnabled;
    final iconDeactivatedColor =
        isDark ? Styles.iconDeactivatedDark : Styles.iconDeactivatedLight;
    final iconActivatedColor =
        isDark ? Styles.iconActivatedDark : Styles.iconActivatedLight;

    final bottomBarColor = isDark
        ? Styles.bottomBarBackgroundDark
        : Styles.bottomBarBackgroundLight;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: const [
            HomePage(),
            ExamplePage(titlePage: 'Cart'),
            ExamplePage(titlePage: 'Cart'),
            ExamplePage(titlePage: 'Orders'),
            ExamplePage(titlePage: 'Wallet'),
            ExamplePage(titlePage: 'Profile'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        backgroundColor: bottomBarColor,
        elevation: 0,
        selectedItemColor:  isDark ? Styles.iconActivatedDark : Styles.iconActivatedLight,
        unselectedItemColor:  isDark ? Styles.iconDeactivatedDark : Styles.iconDeactivatedLight,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.house,
              color: _currentIndex == 0
                  ? iconActivatedColor
                  : iconDeactivatedColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.bagShopping,
              color: _currentIndex == 1
                  ? iconActivatedColor
                  : iconDeactivatedColor,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.cartShopping,
              color: _currentIndex == 2
                  ? iconActivatedColor
                  : iconDeactivatedColor,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.wallet,
              color: _currentIndex == 3
                  ? iconActivatedColor
                  : iconDeactivatedColor,
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.user,
              color: _currentIndex == 4
                  ? iconActivatedColor
                  : iconDeactivatedColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
