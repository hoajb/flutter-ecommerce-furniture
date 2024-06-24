import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/config/routes/routes.dart';
import 'package:flutter_ecommerce_furniture/core/wigets/action_button.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> _imagePaths = [
    'assets/images/onboarding_1.jpg',
    'assets/images/onboarding_2.jpg',
    'assets/images/onboarding_3.jpg',
    'assets/images/onboarding_4.jpg',
  ];

  final List<String> _texts = [
    'Creating Elegant Spaces \nwith Premium Furniture Selections.\n',
    'Bringing Your Vision \nto Life through \nThoughtfully Curated Furniture.',
    'Crafting Furniture \nwith Impeccable Quality and \nDistinctive Design Elements.',
    'Enhancing Every Corner of \nYour Home with Stylish and \nFunctional Furniture Pieces.',
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 2 / 3,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _imagePaths.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  _imagePaths[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
                height: screenHeight * 1 / 5,
                child: Text(
                  _texts[_currentPage],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ActionButton(
              // Updated to use ActionButton
              text: _currentPage == _imagePaths.length - 1
                  ? "Get Started"
                  : "Next",
              matchParentWidth: true,
              onPressed: () {
                if (_currentPage < _imagePaths.length - 1) {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                } else {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.welcome, (route) => false);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _imagePaths.length; i++) {
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
}
