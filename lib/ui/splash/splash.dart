import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/ui/onboarding/onboarding_page_view.dart';
import 'package:todo_list_app/ui/welcome/welcome_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _checkAppState(BuildContext context) async {
    final isCompleted = await _isCompleted();
    if (context.mounted) {
      if (isCompleted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomePage(isFirstInstallApp: false),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingPageView()),
        );
      }
    }
  }

  Future<bool> _isCompleted() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final result = prefs.getBool("OnboardingCompleted");
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkAppState(context);
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(child: _buildBodyPage()),
    );
  }

  Widget _buildBodyPage() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildIconSplash(), _buildTextSplash()],
      ),
    );
  }

  Widget _buildIconSplash() {
    return Image.asset(
      "assets/images/splash_icon.png",
      width: 95,
      height: 80,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTextSplash() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        "UpTodo",
        style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
