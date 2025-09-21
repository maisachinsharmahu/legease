import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leagese/colors.dart';

class onboarding_Screen extends StatelessWidget {
  const onboarding_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          topgradient(),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  child: Image.asset(
                    'assets/img/o1.png',
                    height: 0.5.sh, // Scaled height
                    width: 1.sw, // Scaled width
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 10.h, // Scaled height
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ), // Scaled horizontal padding
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: SizedBox(
                            // height: 40.h, // Scaled height
                            child: Text(
                              " Welcome To ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: MyColors.textPrimary,
                                fontSize: 32.sp, // Scaled font size
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            // height: 45.h, // Scaled height
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  bottom: 2.h, // Scaled bottom position
                                  left: 10.w, // Scaled left position
                                  child: Container(
                                    height: 10.h, // Scaled height
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color:
                                          const Color.fromARGB(
                                            255,
                                            15,
                                            98,
                                            98,
                                          ).withOpacity(
                                            0.5,
                                          ), // Scaled border radius
                                      // color: MyColors,
                                    ),
                                    child: Text(
                                      "LegEase",
                                      style: TextStyle(
                                        color: Colors.transparent,
                                        fontSize: 35.sp, // Scaled font size
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Text(
                                    " LegEase",
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                    style: TextStyle(
                                      color: MyColors.textPrimary,
                                      fontSize: 32.sp, // Scaled font size
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h, // Scaled height
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ), // Scaled horizontal padding
                  child: Text(
                    "Turn confusing legal documents into clear, actionable insights.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18.sp, // Scaled font size
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class onboarding_Screen1 extends StatelessWidget {
  const onboarding_Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          topgradient(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  child: Image.asset(
                    'assets/img/O2.png',
                    height: 0.45.sh, // Scaled height
                    width: 0.9.sw, // Scaled width
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10.h, // Scaled height
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ), // Scaled horizontal padding
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: SizedBox(
                            // height: 40.h, // Scaled height
                            child: Text(
                              " No More ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: MyColors.textPrimary,
                                fontSize: 32.sp, // Scaled font size
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            // height: 45.h, // Scaled height
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  bottom: 2.h, // Scaled bottom position
                                  left: 10.w, // Scaled left position
                                  child: Container(
                                    height: 10.h, // Scaled height
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color:
                                          const Color.fromARGB(
                                            255,
                                            15,
                                            98,
                                            98,
                                          ).withOpacity(
                                            0.5,
                                          ), // Scaled border radius
                                      // color: MyColors,
                                    ),
                                    child: Text(
                                      "  Legal Jargons",
                                      style: TextStyle(
                                        color: Colors.transparent,
                                        fontSize: 35.sp, // Scaled font size
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Text(
                                    "  Legal Jargons ",
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                    style: TextStyle(
                                      color: MyColors.textPrimary,
                                      fontSize: 32.sp, // Scaled font size
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h, // Scaled height
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ), // Scaled horizontal padding
                  child: Text(
                    "Upload contracts and get plain-language summaries you can actually understand.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18.sp, // Scaled font size
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class onboarding_Screen2 extends StatelessWidget {
  const onboarding_Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          topgradient(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  child: Image.asset(
                    'assets/img/o3.png',
                    height: 0.45.sh, // Scaled height
                    width: 1.sw, // Scaled width
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 10.h, // Scaled height
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ), // Scaled padding
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: SizedBox(
                            height: 40.h, // Scaled height
                            child: Text(
                              "Smarter Contracts,  ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: MyColors.textPrimary,
                                fontSize: 32.sp, // Scaled font size
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            height: 40.h, // Scaled height
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  bottom: 2.h, // Scaled position
                                  right: 0,
                                  child: Container(
                                    height: 10.h, // Scaled height
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      // Scaled border radius
                                      color: const Color.fromARGB(
                                        255,
                                        15,
                                        98,
                                        98,
                                      ).withOpacity(0.5),
                                    ),
                                    child: Text(
                                      "Safer Decisions ",
                                      style: TextStyle(
                                        color: Colors.transparent,
                                        fontSize: 36.sp, // Scaled font size
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Text(
                                    "Safer Decisions ",
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                    style: TextStyle(
                                      color: MyColors.textPrimary,
                                      fontSize: 32.sp, // Scaled font size
                                      fontWeight: FontWeight.w700,
                                      // fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h, // Scaled height
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ), // Scaled padding
                  child: Text(
                    "Every deal is secured with a digital contract, ensuring clear terms and fair resolutions",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18.sp, // Scaled font size
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class onboarding_Screen3 extends StatelessWidget {
  const onboarding_Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          topgradient(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  child: Image.asset(
                    'assets/img/o4.png',
                    height: 0.45.sh, // Scaled height
                    width: 1.sw, // Scaled width
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 10.h, // Scaled height
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ), // Scaled padding
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: SizedBox(
                            height: 40.h, // Scaled height
                            child: Text(
                              "Your Legal Assistant,  ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: MyColors.textPrimary,
                                fontSize: 32.sp, // Scaled font size
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            height: 40.h, // Scaled height
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  bottom: 2.h, // Scaled position
                                  right: 0,
                                  child: Container(
                                    height: 10.h, // Scaled height
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      // Scaled border radius
                                      color: const Color.fromARGB(
                                        255,
                                        15,
                                        98,
                                        98,
                                      ).withOpacity(0.5),
                                    ),
                                    child: Text(
                                      "Anytime ",
                                      style: TextStyle(
                                        color: Colors.transparent,
                                        fontSize: 36.sp, // Scaled font size
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Text(
                                    "Anytime ",
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                    style: TextStyle(
                                      color: MyColors.textPrimary,
                                      fontSize: 32.sp, // Scaled font size
                                      fontWeight: FontWeight.w700,
                                      // fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h, // Scaled height
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ), // Scaled padding
                  child: Text(
                    "Join thousands simplifying law with AI + expert support. Get started now.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18.sp, // Scaled font size
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class topgradient extends StatelessWidget {
  const topgradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(-0.8, -1.2),
              radius: 1.0,
              colors: [
                const Color(0xFF006666).withOpacity(0.7),
                Colors.transparent,
              ],
              stops: const [0.1, 1.0],
            ),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.8, -1.2),
              radius: 1.0,
              colors: [
                const Color(0xFF006666).withOpacity(0.7),
                Colors.transparent,
              ],
              stops: const [0.1, 1.0],
            ),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2,
        ),
      ],
    );
  }
}
