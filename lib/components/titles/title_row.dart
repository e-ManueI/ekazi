import 'package:ekazi/components/buttons/outline_button.dart';
import 'package:ekazi/util/capitalize_first_letter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleRow extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback? onPressed;

  const TitleRow({
    super.key,
    required this.title,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              capitalizeFirstLetter(title),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF195198),
              ),
            ),
            MyOutlinedButton(
              buttonText: buttonText,
              onPressed: () {
                // Your logic here
              },
            )
          ],
        ),
      ),
    );
  }
}
