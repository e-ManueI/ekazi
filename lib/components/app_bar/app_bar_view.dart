// lib/widgets/app_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
          // margin: EdgeInsets.only(left: 10),
          child: Image.asset(
        'assets/logo/logo2.png',
        width: 70.sp,
        height: 70.sp,
      )), // Add your logo
      // leadingWidth: 0.01,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
        ),
      ],
      // backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
