import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// Ensure you have these imports in your actual file
import '../../utils/app_constants.dart';

class WgListTile extends StatelessWidget {
  final String title;
  final String tagline;
  final String description;
  final String category;
  final int? upvotes;
  final int? commentCount; // Added optional comments
  final double? rating;
  final VoidCallback onTap;

  const WgListTile({
    super.key,
    required this.title,
    required this.tagline,
    required this.description,
    required this.category,
    required this.onTap,
    this.upvotes = 0,
    this.commentCount, // Optional
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h), // Reduced margin slightly
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          // REMOVED SHADOW, ADDED BORDER
          border: Border.all(color: AppConstants.primaryBlackColor.withValues(), width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header: Icon + Name + Tagline + Score ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Startup Icon / Avatar
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: AppConstants.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        title.isNotEmpty ? title[0].toUpperCase() : "?",
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp, // REDUCED FONT SIZE (Was 24)
                          fontWeight: FontWeight.bold,
                          color: AppConstants.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  // 2. Name & Tagline
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          tagline,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400, // REMOVED ITALIC
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // 3. Rating Badge (Optional)
                  if (rating != null)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: _getRatingColor(rating!).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, size: 12.sp, color: _getRatingColor(rating!)),
                          SizedBox(width: 4.w),
                          Text(
                            rating.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: _getRatingColor(rating!),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),

              SizedBox(height: 12.h),

              // --- Body: Description ---
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 16.h),
              Divider(color: Colors.grey.withOpacity(0.1), height: 1),
              SizedBox(height: 12.h),

              // --- Footer: Category + Upvotes + Comments ---
              Row(
                children: [
                  // Category Tag WITH ICON
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: Colors.blue.withOpacity(0.2)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.layers_outlined, size: 12.sp, color: AppConstants.primaryColor), // ADDED ICON
                        SizedBox(width: 4.w),
                        Text(
                          category,
                          style: GoogleFonts.poppins(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Upvotes Count
                  Row(
                    children: [
                      Icon(Icons.thumb_up_alt_outlined, size: 16.sp),
                      SizedBox(width: 6.w),
                      Text(
                        "$upvotes",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  // Optional Comments Icon (Only shows if commentCount is passed)
                  if (commentCount != null) ...[
                    SizedBox(width: 16.w),
                    Row(
                      children: [
                        Icon(Icons.chat_bubble_outline_rounded, size: 16.sp, color: Colors.grey[400]),
                        SizedBox(width: 6.w),
                        Text(
                          "$commentCount",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getRatingColor(double score) {
    if (score >= 4.5) return Colors.green;
    if (score >= 3.0) return Colors.orange;
    return Colors.red;
  }
}