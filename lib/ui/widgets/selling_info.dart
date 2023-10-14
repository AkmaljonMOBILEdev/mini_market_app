import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_market_app/utils/icons.dart';

class SellingInfoHolder extends StatelessWidget {
  const SellingInfoHolder({
    super.key,
    required this.onTap, required this.isSuccess,
  });

  final bool isSuccess;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(20.w),
          decoration:  BoxDecoration(
            color: Color(0xFFF8F8FB),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: Colors.deepPurpleAccent,
              width: 1.w
            )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(right: 80.w, left: 80.w, top: 40.h, bottom: 30.h),
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: Color(isSuccess?0xFFD8F3F1:0xFFF6E3DB),
                  borderRadius: BorderRadius.circular(16.r)
                ),
                child: SvgPicture.asset(isSuccess?AppIcons.success:AppIcons.warning, width: 48.w,height: 48.h,),
              ),
              Text(isSuccess?"Mahsulot sotildi!":"Mahsulot topilmadi!", style: TextStyle(
                fontSize: 18.sp,
                fontFamily: "Sora"
              ),)
            ],
          ),
        ),
        SizedBox(height: 24.h,),
        ElevatedButton(onPressed: onTap, child: Text("Menyuga qaytish"))
      ],
    );
  }
}
