// StartupPage.dart
import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:digital_market/views/Home/home_navbar.dart';
import 'package:digital_market/views/StartUp/startup_widget.dart';
import 'package:flutter/material.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.buttonColr,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          StartupScreen(
              backgroundColor: 'assets/images/intro_one.jpg',
              imagePath: 'assets/icons/intro_one_icon.png',
              title: 'Choose Products ',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend.',
              currentIndex: _currentIndex,
              screenIndex: 0,
              pageController: _pageController,
              buttonTitle: 'Next'),
          StartupScreen(
              backgroundColor: 'assets/images/intro_two.png',
              imagePath: 'assets/icons/intro_two_icon.png',
              title: 'Get Your Order',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.',
              currentIndex: _currentIndex,
              screenIndex: 1,
              pageController: _pageController,
              buttonTitle: 'Next'),
          StartupScreen(
              backgroundColor: 'assets/images/intro_three.png',
              imagePath: 'assets/icons/intro_three_icon.png',
              title: 'Make Payment',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.',
              currentIndex: _currentIndex,
              screenIndex: 2,
              pageController: _pageController,
              buttonTitle: 'Get Started'),
        ],
      ),
      // floatingActionButton: _currentIndex == 2
      //     ? FloatingActionButton(
      //   backgroundColor:  ColorsManager.buttonColr,
      //   onPressed: () {
      //     Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(builder: (context) => const HomeNavbar()),
      //     );
      //   },
      //   child: const Icon(Icons.arrow_forward),
      // )
      //     : null,
    );
  }
}
