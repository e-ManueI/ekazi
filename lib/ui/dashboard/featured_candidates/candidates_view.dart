import 'package:ekazi/components/titles/title_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'candidates_controller.dart';

class CandidateListView extends StatelessWidget {
  final CandidateController candidateController =
      Get.put(CandidateController());

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 20),
      height: 210.h, // Adjust the height for the design
      child: Column(
        children: [
          TitleRow(
            title: 'Featured Candidates',
            buttonText: 'see more',
            onPressed: () {
              // Add navigation logic here, e.g., Get.to(FeedPage());
            },
          ),
          SizedBox(height: 15.sp),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Obx(() => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: candidateController.candidates.length,
                    itemBuilder: (context, index) {
                      final candidate = candidateController.candidates[index];
                      return Container(
                        width: 150.w,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 6.r,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Candidate Image
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.r),
                                topRight: Radius.circular(12.r),
                              ),
                              child: Image.asset(
                                candidate.profilePicture,
                                height: 90.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 6.h),

                            // Candidate Details
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    candidate.name,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: 4.h),

                                  Text(
                                    candidate.position,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Colors.grey[700],
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: 4.h),

                                  // Location Row with Icon
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 11.sp,
                                        color: Colors.grey[600],
                                      ),
                                      SizedBox(width: 4.w),
                                      Expanded(
                                        child: Text(
                                          candidate.location,
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            color: Colors.grey[600],
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )),
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
