import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_market_app/cubits/selling_cubit/selling_cubit.dart';
import 'package:mini_market_app/ui/widgets/selling_info.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Sell Screen"),
      ),
      body: BlocConsumer<SellingCubit, SellingState>(
        builder: (context, state) {
          if(state is NoSellingProduct){
            return Center(child: SellingInfoHolder(isSuccess: false, onTap: (){
              Navigator.pop(context);
            }));
          }
          if(state is ProductIsSold){
            return Center(child: SellingInfoHolder(isSuccess: true, onTap: (){
              Navigator.pop(context);
            }));
          }
          return const SizedBox();
        },
        listener: (context, state) {},
      ),
    );
  }
}
