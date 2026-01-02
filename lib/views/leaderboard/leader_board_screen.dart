import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/home_screen_controller.dart';
import '../../models/trending_idea_model.dart';
import '../../utils/app_constants.dart';

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.find<HomeScreenController>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            "Top Startup Idea",
            style: GoogleFonts.ubuntu(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
            ),
          ),
          bottom: TabBar(
            labelColor: AppConstants.primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppConstants.primaryColor,
            indicatorWeight: 3,
            labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: "Top Voted"),
              Tab(text: "Top AI Rated"),
            ],
          ),
        ),
        body: Obx(() {
          return TabBarView(
            children: [
              _buildRankingList(controller.topVotedIdeas, isByVotes: true),
              _buildRankingList(controller.topRatedIdeas, isByVotes: false),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildRankingList(List<TrendingIdeaModel> ideas, {required bool isByVotes}) {
    if (ideas.isEmpty) {
      return Center(child: Text("No ideas yet!", style: GoogleFonts.poppins()));
    }

    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: ideas.length,
      itemBuilder: (context, index) {
        final idea = ideas[index];
        final rank = index + 1;

        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: rank == 1 ? Border.all(color: const Color(0xFFFFD700), width: 2) : null,
          ),
          child: Row(
            children: [
              _buildRankBadge(rank),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      idea.name,
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      idea.tagline,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isByVotes
                      ? Colors.blue.shade50
                      : Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    Icon(
                      isByVotes ? Icons.thumb_up : Icons.auto_awesome,
                      size: 16.sp,
                      color: isByVotes ? Colors.blue : Colors.purple,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      isByVotes
                          ? "${idea.upvotes}"
                          : "${idea.rating}",
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: isByVotes ? Colors.blue : Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRankBadge(int rank) {
    Color color;
    IconData? icon;

    switch (rank) {
      case 1:
        color = const Color(0xFFFFD700);
        icon = Icons.emoji_events;
        break;
      case 2:
        color = const Color(0xFFC0C0C0);
        icon = Icons.looks_two;
        break;
      case 3:
        color = const Color(0xFFCD7F32);
        icon = Icons.looks_3;
        break;
      default:
        color = Colors.grey.shade300;
        icon = null;
    }

    if (rank <= 3) {
      return CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.2),
        radius: 22.r,
        child: Icon(icon, color: color, size: 24.sp),
      );
    } else {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 22.r,
        child: Text(
          "#$rank",
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade500,
            fontSize: 16.sp,
          ),
        ),
      );
    }
  }
}