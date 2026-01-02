import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_constants.dart';

class WgHeader extends StatelessWidget {
  final String title;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPrefixTap;
  final VoidCallback? onSuffixTap;

  const WgHeader({
    super.key,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.onPrefixTap,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (prefixIcon != null)
          IconButton(
            onPressed: onPrefixTap,
            icon: Icon(prefixIcon, color: AppConstants.primaryBlackColor),
          ),

        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        const Spacer(),
        if (suffixIcon != null)
          IconButton(
            onPressed: onSuffixTap,
            icon: const Icon(Icons.notifications_none_outlined,color: AppConstants.primaryBlackColor,),
          ),
      ],
    );
  }
}
