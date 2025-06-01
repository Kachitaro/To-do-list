import 'package:flutter/material.dart';
import 'package:todo_list_app/ui/onboarding/onboarding_child_page.dart';
import 'package:todo_list_app/ui/welcome/welcome_page.dart';
import 'package:todo_list_app/utils/onboarding_position.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: onboardingDataList.length,
        itemBuilder: (context, index) {
          return OnboardingChildPage(
            index: index,
            nextOnPressed: () {
              if (index == onboardingDataList.length - 1) {
                _gotoWelcomePage();
              } else {
                _pageController.jumpToPage(index + 1);
              }
            },
            prevOnPressed: () {
              if (index != 0) {
                _pageController.jumpToPage(index - 1);
              }
            },
            skipOnPressed: () {
              _gotoWelcomePage();
            },
          );
        },
      ),
    );
  }

  void _gotoWelcomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WelcomePage()),
    );
  }
}
