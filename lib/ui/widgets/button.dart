import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.onTap, required this.title});
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 320.w,
      // padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r)
      ),
      child: ElevatedButton(onPressed: onTap,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: Text(title)),
    );
  }
}
