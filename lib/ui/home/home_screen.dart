import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_market_app/cubits/get_all/get_all_cubit.dart';
import 'package:mini_market_app/ui/add/add_screen.dart';
import 'package:mini_market_app/ui/add/scanner.dart';
import 'package:mini_market_app/ui/home/all_products/all_products.dart';
import 'package:mini_market_app/ui/home/widgets/main_widgets.dart';
import 'package:mini_market_app/ui/sell/scanr_for_sell.dart';
import 'package:mini_market_app/ui/sell/sell_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            Text("Mening do'konim",
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 34.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "Sora",
              color: Color(0xFF6FE670)
            ),),
            SizedBox(
                // height: 400.h,
                // width: 400.w,
                child: Lottie.asset("assets/lottie/main.json")),
            // Image.asset("assets/images/logo.jpg"),
            SizedBox(height: 60.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainWidgets(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScanProduct()));
                  },
                  isSell: false,
                ),
                MainWidgets(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScanForSell()));
                  },
                  isSell: true,
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GetAllCubit>().getAll();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AllProductsScreen()));
        },
        backgroundColor: Color(0xFFDBDAF7),
        child: const Center(
            child: Text(
          "Jami",
          style: TextStyle(
            color: Color(0xFF5A6CF3),
            // fontSize: 8
          ),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
