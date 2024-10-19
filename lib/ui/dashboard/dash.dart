// lib/pages/dashboard.dart
import 'package:ekazi/ui/dashboard/adds_swiper/adds_swiper_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/app_bar/app_bar_view.dart';
import 'category_tabs/category_tabs_view.dart';
import 'jobs_card/jobs_horizontal_scroll.dart';
import '../../components/search_input/search_input_view.dart';
import 'package:ekazi/components/navigation_bottom/nav_bottom_view.dart';
import 'package:ekazi/ui/dashboard/featured_candidates/candidates_view.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.sp),
            SearchInput(),
            SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(height: 10.sp),
                CategoryTabs(),
                AddsSection(),
                SizedBox(height: 10.sp),
                JobHorizontalScroll(), // Dynamically filtered job cards
                SizedBox(height: 12.sp),
                CandidateListView()
              ],
            )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavView(),
    );
  }
}
