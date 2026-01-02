
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_constants.dart';
import '../widgets/wg_onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  final List<OnBoardingData> onBoardingList = [
    OnBoardingData(
      title1: "Validate your, ",
      title2: "idea",
      description1: "Pitch a startup idea anytime, anywhere", // 6 words
      description2: "pitch,vote & grow", // 3 words
      image: "assets/images/img_1.png",
    ),
    OnBoardingData(
      title1: "Detailed, ",
      title2: "Insights",
      description1: "Every pitch is analyzed and scored to give you",
      description2: "fast, honest, data-driven help.",
      image: "assets/images/ob2.png",
    ),
    OnBoardingData(
      title1: " Build Your ,",
      title2: "Dream",
      description1: "Test only what you need quickly,smartly,per idea",
      description2: "Real, instant, community feedback",
      image: "assets/images/ob3.png",
    ),
  ];
  final OnboardingController _controller = Get.put(OnboardingController());
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Expanded(
              child: PageView.builder(
                controller: _controller.pageController,
                itemCount: onBoardingList.length,
                onPageChanged: (index) {
                  _controller.currentPageIndex.value = index;
                },
                itemBuilder: (context, index) {
                  final data = onBoardingList[index];
                  return WgOnboarding(
                    wgTitle1: data.title1,
                    wgDescription1: data.description1,
                    wgImage: data.image,
                    wgTitle2: data.title2,
                    wgDescription2: data.description2,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    _controller.skip();
                  },
                  child: Text(
                    "Skip",
                    style: GoogleFonts.ubuntu(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 20.h),
                ...List.generate(
                  onBoardingList.length,
                      (index) => Obx(
                        () => Container(
                      height: 7.h,
                      width: 7.w,
                      decoration: BoxDecoration(
                        color: _controller.currentPageIndex.value == index
                            ? AppConstants
                            .primaryColor // active dot
                            : Colors.grey, // inactive dot
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.h),
                IconButton(
                  color: AppConstants.primaryColor,

                  onPressed: () {
                    _controller.nextPages(onBoardingList.length - 1);
                  },
                  icon: Icon(Icons.arrow_circle_right, size: 30.sp),
                ),
              ],
            ),
            SizedBox(height: 20.h),

          ],
        ),
      ),
    );
  }
}

///Onboarding Controller class
class OnboardingController extends GetxController {
  var currentPageIndex = 0.obs;

  final box = GetStorage();
  PageController pageController = PageController();

  void nextPages(int totalPage) {
    if (currentPageIndex.value < totalPage) {
      currentPageIndex.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      finishedOnboarding();
    }
  }
  void skip() {
    finishedOnboarding();
  }
  void finishedOnboarding() {
    box.write('isFirstTime', false);
    final token = box.read('token');
    if (token != null) {
      Get.offAllNamed('/navigation'); // Or AppRoutes.navigation
    } else {
      Get.offAllNamed('/login'); // Or AppRoutes.login
    }
  }
}

class OnBoardingData {
  late final String title1;
  late final String title2;
  late final String description1;
  late final String description2;
  late final String image;

  OnBoardingData({
    required this.title1,
    required this.title2,
    required this.description1,
    required this.description2,
    required this.image,
  });
}
