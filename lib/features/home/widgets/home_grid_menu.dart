import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';

import '../../../config/theme/styles.dart';

const _numberItemPerRow = 4;

class HomeMenu {
  final int id;
  final String iconPathLight;
  final String iconPathDark;
  final String title;

  HomeMenu({
    required this.id,
    required this.iconPathLight,
    required this.iconPathDark,
    required this.title,
  });
}

final List<HomeMenu> _homeMenus = [
  HomeMenu(
      id: 0,
      iconPathLight: 'assets/images/ic-wing-chair-100.png',
      iconPathDark: 'assets/images/ic-wing-chair-100-white.png',
      title: 'Sofa'),
  HomeMenu(
      id: 1,
      iconPathLight: 'assets/images/ic-chair-100.png',
      iconPathDark: 'assets/images/ic-chair-100-white.png',
      title: 'Chair'),
  HomeMenu(
      id: 2,
      iconPathLight: 'assets/images/ic-table-100.png',
      iconPathDark: 'assets/images/ic-table-100-white.png',
      title: 'Table'),
  HomeMenu(
      id: 3,
      iconPathLight: 'assets/images/ic-fridge-100.png',
      iconPathDark: 'assets/images/ic-fridge-100-white.png',
      title: 'Kitchen'),
  HomeMenu(
      id: 4,
      iconPathLight: 'assets/images/ic-lamp-100.png',
      iconPathDark: 'assets/images/ic-lamp-100-white.png',
      title: 'Lamp'),
  HomeMenu(
      id: 5,
      iconPathLight: 'assets/images/ic-cupboard-100.png',
      iconPathDark: 'assets/images/ic-cupboard-100-white.png',
      title: 'Cupboard'),
  HomeMenu(
      id: 6,
      iconPathLight: 'assets/images/ic-archeology-100.png',
      iconPathDark: 'assets/images/ic-archeology-100-white.png',
      title: 'Vase'),
  HomeMenu(
      id: 7,
      iconPathLight: 'assets/images/ic-more-100.png',
      iconPathDark: 'assets/images/ic-more-100-white.png',
      title: 'Others'),
];

class HomeMenuGrid extends StatelessWidget {
  final void Function(HomeMenu) onSelectedMenu;

  const HomeMenuGrid({super.key, required this.onSelectedMenu});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 0 * _numberItemPerRow; i < 1 * _numberItemPerRow; i++)
              CircularMenuItem(
                pos: i,
                onSelectedMenu: onSelectedMenu,
              )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 1 * _numberItemPerRow; i < 2 * _numberItemPerRow; i++)
              CircularMenuItem(
                pos: i,
                onSelectedMenu: onSelectedMenu,
              )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 2 * _numberItemPerRow; i < 3 * _numberItemPerRow; i++)
              CircularMenuItem(
                pos: i,
                onSelectedMenu: onSelectedMenu,
              )
          ],
        )
      ],
    );
  }
}

class CircularMenuItem extends StatelessWidget {
  final int pos;
  final void Function(HomeMenu) onSelectedMenu;

  const CircularMenuItem(
      {super.key, required this.pos, required this.onSelectedMenu});

  @override
  Widget build(BuildContext context) {
    if (pos > _homeMenus.length - 1) return const Spacer();
    final isDark = context.isDarkModeEnabled;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              onSelectedMenu.call(_homeMenus[pos]);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
              backgroundColor:
                  isDark ? Styles.itemColorBgDark : Styles.itemColorBgLight,
              foregroundColor: Styles.grayColor,
            ),
            child: Image.asset(
              isDark
                  ? _homeMenus[pos].iconPathDark
                  : _homeMenus[pos].iconPathLight,
              width: 26,
              height: 26,
              color:
                  isDark ? Styles.iconActivatedDark : Styles.iconActivatedLight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
          child: Text(
            _homeMenus[pos].title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
