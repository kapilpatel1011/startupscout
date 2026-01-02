
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_constants.dart';

class WgButton extends StatelessWidget {

  final String? text;

  final Widget? child;
  final Color buttonColor;
  final double height;
  final double width;
  final VoidCallback onTap;
  const WgButton({super.key,  this.text,  this.buttonColor = AppConstants.primaryColor, required this.onTap, this.height = 40,  this.width = 400,  this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: buttonColor,
        ),
        child: Center(
          child: child ?? Text(text ?? " ",style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,)),
        ),
      ),
    );
  }
}
