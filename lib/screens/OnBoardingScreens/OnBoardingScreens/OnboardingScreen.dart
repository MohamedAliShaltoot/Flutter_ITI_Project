import 'package:flutter/material.dart';
import 'package:tickety/screens/AuthScreens/signUpScreen/signUpScreen.dart';
import 'package:tickety/screens/OnBoardingScreens/OnBoardingScreens/widgets/MockupImage.dart';
import 'package:tickety/screens/OnBoardingScreens/OnBoardingScreens/widgets/OnboardingData.dart';
import 'package:tickety/screens/OnBoardingScreens/OnBoardingScreens/widgets/OnboardingSlide.dart';
import '../../../core/constants/app_Colors.dart';
import '../../../core/constants/imageAssets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  static const String _subtitle =
      'In publishing and graphic design, Lorem is\na placeholder text commonly';

  final List<OnboardingData> _pages = const [
    OnboardingData(
      title: 'Explore Upcoming and\nNearby Events',
      subtitle: _subtitle,
      phoneMockup: MockupImage(
        assetPath: ImageAssets.onboardingOneImage,
        label: 'Onboarding 1\nEvents Home',
      ),
      borderColor: AppColors.primaryColor,
    ),
    OnboardingData(
      title: 'We Have Modern Events\nCalendar Feature',
      subtitle: _subtitle,
      phoneMockup: MockupImage(
        assetPath: ImageAssets.onboardingTwoImage,
        label: 'Onboarding 2\nCalendar View',
      ),
      borderColor: AppColors.primaryColor,
    ),
    OnboardingData(
      title: 'To Look Up More Events or\nActivities Nearby By Map',
      subtitle: _subtitle,
      phoneMockup: MockupImage(
        assetPath: ImageAssets.onboardingThreeImage,
        label: 'Onboarding 3\nMap View',
      ),
      borderColor: AppColors.primaryColor,
    ),
  ];

  void _goToNext() {
    if (_currentPage < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _finish();
    }
  }

  void _skip() => _finish();

  void _finish() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  SignUpScreen(

      )),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          itemCount: _pages.length,
          onPageChanged: (i) => setState(() => _currentPage = i),
          itemBuilder: (_, i) => OnboardingSlide(
            data: _pages[i],
            currentPage: _currentPage,
            totalPages: _pages.length,
            onSkip: _skip,
            onNext: _goToNext,
          ),
        ),
      ),
    );
  }
}