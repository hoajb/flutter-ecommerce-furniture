import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/core/ext/buildcontext_ext.dart';
import 'package:flutter_ecommerce_furniture/features/home/data/banner_entity.dart';

import '../../offer/presentation/offer_banner.dart';

const _colorBgLight = Color(0xffe4e4e4);
const _colorBgDark = Color(0xff36383e);

final List<BannerEntity> _banners = [
  BannerEntity(
      assetProductImage: 'assets/images/product-chair-1-removebg.png',
      discount: '25%',
      title: 'Today\'s Special!',
      message: 'Get discount for every\norder. only valid for today'),
  BannerEntity(
      assetProductImage: 'assets/images/product-sofa-removebg-1.png',
      discount: '15%',
      title: 'Tuesday\'s Special!',
      message: 'Get discount for every\norder. only valid for Tuesday'),
  BannerEntity(
      assetProductImage: 'assets/images/product-sofa-removebg-2.png',
      discount: '5%',
      title: 'Weekend\'s Special!',
      message: 'Get discount for every\norder. only valid for Weekend'),
];

class HomeBanners extends StatefulWidget {
  const HomeBanners({super.key});

  @override
  State<HomeBanners> createState() => _HomeBannersState();
}

class _HomeBannersState extends State<HomeBanners> {
  late PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startAutoScroll();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkModeEnabled;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 1 / 6,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? _colorBgDark : _colorBgLight,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _banners.length,
              itemBuilder: (context, index) {
                return OfferBanner(
                  item: _banners[_currentPage],
                );
              },
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (_currentPage < _banners.length - 1) {
        _pageController.nextPage(
            duration: const Duration(seconds: 1), curve: Curves.ease);
      } else {
        _pageController.animateToPage(0,
            duration: const Duration(seconds: 1), curve: Curves.ease);
      }
      _startAutoScroll();
    });
  }

  // Widget _buildBannerView() {
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(30, 20, 20, 10),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           flex: 6,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 _banners[_currentPage].discount,
  //                 style: const TextStyle(
  //                     fontSize: 32, fontWeight: FontWeight.bold),
  //               ),
  //               const SizedBox(height: 8),
  //               Text(
  //                 _banners[_currentPage].title,
  //                 style: const TextStyle(
  //                     fontSize: 18, fontWeight: FontWeight.bold),
  //               ),
  //               const SizedBox(height: 8),
  //               Text(_banners[_currentPage].message),
  //             ],
  //           ),
  //         ),
  //         Expanded(
  //           flex: 4,
  //           child: Image.asset(
  //             _banners[_currentPage].assetProductImage,
  //             width: 180,
  //             height: 180,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _banners.length; i++) {
      indicators.add(
        i == _currentPage ? _indicator(true) : _indicator(false),
      );
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    bool darkModeEnabled = Theme.of(context).brightness == Brightness.dark;
    final activeColor = darkModeEnabled ? Colors.white : Colors.black;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? activeColor : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
