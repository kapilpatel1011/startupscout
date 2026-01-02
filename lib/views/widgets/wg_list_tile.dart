import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_constants.dart';

class WgListTile extends StatelessWidget {
  final String title;
  final String tagline;
  final String description;
  final String category;
  final int? upvotes;
  final int? commentCount;
  final double? rating;
  final bool isLiked;
  final VoidCallback onTap;

  final VoidCallback onThumbUpTap;

  const WgListTile({
    super.key,
    required this.title,
    required this.tagline,
    required this.description,
    required this.category,
    required this.onTap,
    this.upvotes = 0,
    this.commentCount,
    this.rating,
    this.isLiked = false,
    required this.onThumbUpTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppConstants.primaryBlackColor.withValues(),
            width: 0.2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        title.isNotEmpty ? title[0].toUpperCase() : "?",
                        style: GoogleFonts.ubuntu(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppConstants.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.ubuntu(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          tagline,
                          style: GoogleFonts.ubuntu(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),
              Text(
                description,
                softWrap: true,
                style: GoogleFonts.ubuntu(
                  fontSize: 13.sp,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 16.h),
              Divider(color: Colors.grey.withOpacity(0.1), height: 1),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: AppConstants.primaryColor.withValues(),
                        width: 0.2,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.category_outlined,
                          size: 12.sp,
                          color: AppConstants.primaryColor,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          category,
                          style: GoogleFonts.ubuntu(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),
                  Row(
                    children: [
                      if (rating != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: _getRatingColor(rating!).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.auto_awesome,
                                size: 12.sp,
                                color: _getRatingColor(rating!),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                rating.toString(),
                                style: GoogleFonts.ubuntu(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: _getRatingColor(rating!),
                                ),
                              ),
                            ],
                          ),
                        ),
                      IconButton(
                        onPressed: onThumbUpTap,
                        icon: Icon(
                          isLiked
                              ? Icons.thumb_up
                              : Icons.thumb_up_alt_outlined,
                          size: 16.sp,
                        ),
                      ),
                      Text(
                        "$upvotes",
                        style: GoogleFonts.ubuntu(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  if (commentCount != null) ...[
                    SizedBox(width: 16.w),
                    Row(
                      children: [
                        Icon(
                          Icons.chat_bubble_outline_rounded,
                          size: 16.sp,
                          color: Colors.grey[400],
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          "$commentCount",
                          style: GoogleFonts.ubuntu(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getRatingColor(double score) {
    if (score >= 80) return Colors.green;
    if (score >= 30) return Colors.orange;
    return Colors.red;
  }
}
