import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../jobs_card/jobs_controller.dart';

class CategoryTabs extends StatelessWidget {
  final JobController jobController = Get.put(JobController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: jobController.categories.length,
      child: Column(
        children: <Widget>[
          TabBar(
            tabs: jobController.categories
                .map((category) => Tab(
                      text: category,
                    ))
                .toList(),
            labelColor: Colors.black,
            indicatorColor: Color(0xffbf6324),
            labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold), // Responsive font size
            onTap: (index) {
              jobController.switchCategory(index);
            },
          ),
        ],
      ),
    );
  }
}
