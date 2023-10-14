import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_market_app/cubits/adding_cubit/adding_cubit.dart';
import 'package:mini_market_app/ui/add/widgetss/text_field.dart';
import 'package:mini_market_app/ui/widgets/button.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.green,
        title: const Text("Mahsulot qo'shing"),
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<AddingCubit, AddingState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(24.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        "Yangi mahsulot",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 28.sp,
                                fontFamily: 'Sora',
                                color: Colors.green,
                                fontWeight: FontWeight.w600),
                      ),
                    ),
                    AddTextField(
                        isNum: false,
                        hintText: "Nomi",
                        onChanged: (v) {
                          if (v.isNotEmpty) {
                            context.read<AddingCubit>().addName(name: v);
                            debugPrint("onChanged: $v, state: ${state.name}");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Enter product name")),
                            );
                          }
                        }),
                    AddTextField(
                        hintText: "Miqdori",
                        onChanged: (v) {
                          if (int.parse(v) > 0) {
                            context.read<AddingCubit>().addCount(count: int.parse(v));
                            debugPrint("onChanged: $v, state: ${state.count}");

                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Enter product count")),
                            );
                          }
                        }),
                    AddTextField(
                        hintText: "Narxi",
                        onChanged: (v) {
                          context.read<AddingCubit>().addPrice(price: int.parse(v));
                          debugPrint("onChanged: $v, state: ${state.price}");

                        }),
                  ],
                ),
                GlobalButton(
                    onTap: () {
                      context.read<AddingCubit>().addProduct(context: context);
                      Navigator.pop(context);
                    },
                    title: "Add")
              ],
            ),
          );
        },
      ),

    );
  }
}
