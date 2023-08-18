import 'package:flutter/material.dart';

class ProductBanners extends StatefulWidget {
  const ProductBanners({super.key, required this.imagePaths});

  final List<String> imagePaths;

  @override
  State<ProductBanners> createState() => _ProductBannersState();
}

class _ProductBannersState extends State<ProductBanners> {
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
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeight / 3,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: widget.imagePaths.length,
            itemBuilder: (context, index) {
              return Image.asset(
                widget.imagePaths[index],
                fit: BoxFit.fitHeight,
              );
            },
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPageIndicator(),
        ),
      ],
    );
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (_currentPage < widget.imagePaths.length - 1) {
        _pageController.nextPage(
            duration: const Duration(seconds: 1), curve: Curves.ease);
      } else {
        _pageController.animateToPage(0,
            duration: const Duration(seconds: 1), curve: Curves.ease);
      }
      _startAutoScroll();
    });
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < widget.imagePaths.length; i++) {
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
