import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/onboarding_position.dart';

class OnboardingChildPage extends StatelessWidget {
  final int index;
  final VoidCallback nextOnPressed;
  final VoidCallback prevOnPressed;
  final VoidCallback skipOnPressed;

  const OnboardingChildPage({
    super.key,
    required this.index,
    required this.nextOnPressed,
    required this.prevOnPressed,
    required this.skipOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    final data = onboardingDataList[index];

    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSkipButton(),
              _buildOnboardingImage(data),
              _buildOnboardingPageControl(),
              _buildOnboardingTitleAndContent(data),
              _buildOnboardingNextAndPrevButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
        onPressed: () {
          skipOnPressed();
        },
        child: Text(
          "SKIP",
          style: TextStyle(fontSize: 16, color: Colors.white.withAlpha(112)),
        ),
      ),
    );
  }

  Widget _buildOnboardingImage(data) {
    return Image.asset(
      data.image,
      width: 271,
      height: 296,
      fit: BoxFit.contain,
    );
  }

  Widget _buildOnboardingPageControl() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(onboardingDataList.length, (i) {
          return Container(
            height: 4,
            width: 26,
            margin: i == 1
                ? const EdgeInsets.symmetric(horizontal: 8)
                : EdgeInsets.zero,
            decoration: BoxDecoration(
              color: index == i ? Colors.white : Colors.grey,
              borderRadius: BorderRadius.circular(56),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildOnboardingTitleAndContent(data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data.title,
            style: TextStyle(
              color: Colors.white.withAlpha(195),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 42),
          Container(
            child: Text(
              data.content,
              style: TextStyle(
                color: Colors.white.withAlpha(195),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingNextAndPrevButton() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
      ).copyWith(top: 107, bottom: 24),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              prevOnPressed();
            },
            child: Text(
              "BACK",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withAlpha(112),
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              nextOnPressed();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8875FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              index == onboardingDataList.length - 1 ? "GET STARTED" : "NEXT",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
