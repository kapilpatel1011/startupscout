
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startupscout/views/widgets/wg_text.dart';

import '../../utils/app_constants.dart';

class WgOnboarding extends StatelessWidget {
  final String wgTitle1;
  final String wgTitle2;
  final String wgDescription1;
  final String wgDescription2;
  final String wgImage;

  const WgOnboarding({
    super.key,
    required this.wgTitle1,
    required this.wgDescription1,
    required this.wgImage,
    required this.wgTitle2,
    required this.wgDescription2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          WgText(
            spans: [
              TextSpan(
                text: wgTitle1,
                style: GoogleFonts.ubuntu(
                  color: AppConstants.primaryColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: wgTitle2,
                style: GoogleFonts.ubuntu(
                  color: AppConstants.primaryBlackColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          WgText(
            spans: [
              TextSpan(
                text: wgDescription1,
                style: GoogleFonts.ubuntu(
                  color: AppConstants.primaryBlackColor,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          WgText(
            spans: [
              TextSpan(
                text: wgDescription2,
                style: GoogleFonts.ubuntu(
                  color: AppConstants.primaryColor,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          Image.asset(wgImage),
        ],
      ),
    );
  }
}
