
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_constants.dart';

class WgCard extends StatelessWidget {
  final IconData  cardIcon;
  final String cardTitle;
  final String cardSubtitle;
  final Color cardColor;
  final VoidCallback onTap;

  const WgCard({super.key, required this.cardIcon, required this.cardTitle, required this.cardSubtitle, required this.cardColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        height: 100.h,
        width: 160.w,
        decoration: BoxDecoration(
            color: AppConstants.primaryColor,
          borderRadius: BorderRadius.circular(20.r)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(cardIcon,color: Colors.white,size: 30.sp,),
            SizedBox(height: 10.h,),
            Text(cardTitle,style: GoogleFonts.poppins(fontSize: 16.sp,color: Colors.white),),
            Text(cardSubtitle,style: GoogleFonts.poppins(fontSize: 12.sp,color: Colors.white),)

          ],
        ),
      ),
    );
  }
}

class WgServiceCard extends StatelessWidget {

  final String cardTitle;

  final String? cardImage;

  final IconData? cardIcon;


  final Color cardColor;
  final VoidCallback onTap;

  const WgServiceCard({super.key, required this.cardTitle,  this.cardIcon, required this.cardColor, required this.onTap, this.cardImage});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 70.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppConstants.primaryGreyColor,
              borderRadius: BorderRadius.circular(20.r)
            ),
            child: Center(
              child: SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: _buildIconOrImage()),
            ),
          ),
        ),
        SizedBox(height: 2.h,),
        Text(cardTitle,style: GoogleFonts.poppins(fontSize: 16.sp),),
      ],
    );
  }

  Widget _buildIconOrImage(){
    if(cardImage!=null){
      return Image.asset(cardImage!,height: 10.h,width: 10.w, fit: BoxFit.contain,);
    }
    else if(cardIcon!=null){
      return Icon(cardIcon,color: Colors.white,size: 30.sp,);}
    else{
      return Container();
    }
  }
}
