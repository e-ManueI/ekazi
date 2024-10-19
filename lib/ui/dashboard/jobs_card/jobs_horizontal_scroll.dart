import 'package:ekazi/components/titles/title_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'jobs_card.dart';
import 'jobs_controller.dart';

class JobHorizontalScroll extends StatelessWidget {
  final JobController jobController = Get.find<JobController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 255, // Fixed height for the entire container
          child: Column(
            children: [
              TitleRow(
                title: 'Posted Jobs',
                buttonText: 'see more',
                onPressed: () {
                  // Add navigation logic here, e.g., Get.to(FeedPage());
                },
              ),
              SizedBox(height: 5.sp),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: jobController.filteredJobs.length,
                  itemBuilder: (context, index) {
                    var job = jobController.filteredJobs[index];
                    return JobCard(
                      image: job['image']!,
                      company: job['company']!,
                      title: job['title']!,
                      location: job['location']!,
                      deadline: job['deadline']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
