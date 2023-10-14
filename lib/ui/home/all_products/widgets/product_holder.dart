import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_market_app/data/models/product_model/product_model_fields.dart';

class ProductHolder extends StatelessWidget {
  const ProductHolder({super.key, required this.productModelSql});

  final ProductModelSql productModelSql;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
          color: Color(0xFFF8F8FB), borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Color(0xFF25D482)
                ),
                child: SvgPicture.asset("assets/svg/finance.svg"),
              ),
              Text(
                "${productModelSql.price.toString()}",
                style: TextStyle(
                  color: Color(0xFFF08F5F),
                  fontFamily: 'Sora',
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productModelSql.name,
                style:
                    TextStyle(fontFamily: 'Sora',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 8.h,),
              Text(
                "QR: ${productModelSql.qrCode}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFF494949),
                  fontSize: 12.sp
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15.h,),
              Text("${productModelSql.count.toString()} ta", style: TextStyle(
                color: Color(0xFF5A6CF3),
                fontFamily: 'Sora'
              ),),
            ],
          )
        ],
      ),
    );
  }
}
