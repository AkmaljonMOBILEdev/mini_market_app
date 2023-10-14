import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_market_app/utils/icons.dart';

class MainWidgets extends StatelessWidget {
  const MainWidgets({super.key, required this.onTap, required this.isSell});

  final VoidCallback onTap;
  final bool isSell;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Color(0xFF6FE670).withOpacity(.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
                color: Color(0xFFF8F8FB),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.deepPurpleAccent, width: 1.w)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.all(24.w),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                      color: Color(isSell ? 0xFFD8F3F1 : 0xFFDBDAF7),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: SvgPicture.asset(
                    isSell ? AppIcons.sell : AppIcons.add,
                    width: 24.w,
                    height: 24.h,
                    colorFilter: ColorFilter.mode(Color(0xFF5A6CF3), BlendMode.srcIn),
                  ),
                ),
                Text(
                  isSell ? "Sotish" : "Qo'shish",
                  style: TextStyle(
                      // fontSize: 18.sp,
                      fontFamily: "Sora"),
                )
              ],
            ),
          ),
        ],
      ),
    );
    // return Material(
    //   color: Colors.transparent,
    //   child: InkWell(
    //     onTap: onTap,
    //     child: Container(
    //       padding: EdgeInsets.all(20.w),
    //       // height: 176.h,
    //       // width: 158.w,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(16.r),
    //         color: Color(0xFFF8F8FB)
    //       ),
    //       child: Center(
    //         child: Container(
    //           margin: EdgeInsets.all(10.w),
    //           padding: EdgeInsets.all(15.w),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(16.r),
    //             color: Color(isSell?0xFFD8F3F1:0xFFDBDAF7)
    //           ),
    //           child: Center(
    //             child: SvgPicture.asset(AppIcons.add),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
