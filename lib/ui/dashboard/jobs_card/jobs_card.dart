import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobCard extends StatelessWidget {
  final String image;
  final String company;
  final String title;
  final String location;
  final String deadline;

  JobCard({
    required this.image,
    required this.company,
    required this.title,
    required this.location,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w, // Card width
      height: 400.h, // Card height
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
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
        mainAxisSize: MainAxisSize.min, // Shrink-wrap the column's content
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
            child: Image.asset(
              image,
              height: 70.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 6.h),

          // Padding for the rest of the content
          Padding(
            padding: EdgeInsets.only(
              left: 8.w,
              right: 8.w,
              bottom: 8.h,
            ), // Apply horizontal padding here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Company Name
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 4.h),

                // Job Title
                Text(
                  title,
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
                        location,
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
                SizedBox(height: 4.h),

                // Deadline Row
                Text(
                  'Deadline: $deadline',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.red[400],
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
