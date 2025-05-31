class OnboardingData {
  final String image;
  final String title;
  final String content;

  const OnboardingData({
    required this.image,
    required this.title,
    required this.content,
  });
}

const List<OnboardingData> onboardingDataList = [
  OnboardingData(
    image: "assets/images/onboarding_1.png",
    title: "Manage your tasks",
    content: "You can easily manage all of your daily tasks in DoMe for free",
  ),
  OnboardingData(
    image: "assets/images/onboarding_2.png",
    title: "Create daily routine",
    content:
        "In Uptodo you can create your personalized routine to stay productive",
  ),
  OnboardingData(
    image: "assets/images/onboarding_3.png",
    title: "Organize your tasks",
    content:
        "You can organize your daily tasks by adding your tasks into separate categories",
  ),
];
