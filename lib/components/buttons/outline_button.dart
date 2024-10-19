import 'package:ekazi/util/capitalize_first_letter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;

  const MyOutlinedButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed ?? () {},
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: -2.h, horizontal: 8.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
      ),
      child: Text(
        capitalizeFirstLetter('$buttonText >>'),
        style: TextStyle(
          fontSize: 12.sp,
          color: Color(0xFF3F3D56), // Text color
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
