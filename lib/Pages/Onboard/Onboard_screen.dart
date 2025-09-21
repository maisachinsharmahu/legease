import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leagese/Pages/MainPages/Navigation/main_navigation.dart';
import 'package:leagese/Pages/MainPages/Home/homepage.dart';
import 'package:leagese/Pages/Onboard/screen1.dart';
import 'package:leagese/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final List<Widget> onboardingScreensdata = [
    onboarding_Screen(),
    onboarding_Screen1(),
    onboarding_Screen2(),
    onboarding_Screen3(),
  ];
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int myindex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 8,
                child: PageView.builder(
                  itemCount: onboardingScreensdata.length,
                  onPageChanged: (index) {
                    setState(() {
                      myindex = index;
                    });
                  },
                  controller: _pageController,
                  itemBuilder: (context, index) => onboardingScreensdata[index],
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 40.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: SizedBox(
                        height: 55.h,
                        width: 160.w,
                        child: GestureDetector(
                          onTap: () async {
                            if (myindex == 3) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => MainNavigation(),
                                ),
                              );
                            } else {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColors.primary,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Center(
                              child: myindex == 3
                                  ? Text(
                                      "Let's Go",
                                      style: TextStyle(
                                        fontSize: 26.sp,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Icon(
                                      Icons.east,
                                      color: Colors.white,
                                      size: 35.sp,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: onboardingScreensdata.length,
                      onDotClicked: (index) => _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.bounceIn,
                      ),
                      effect: ExpandingDotsEffect(
                        activeDotColor: MyColors.primary,
                        dotHeight: 12.h,
                        dotWidth: 12.w,
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
