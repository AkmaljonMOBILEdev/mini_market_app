import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_market_app/cubits/adding_cubit/adding_cubit.dart';
import 'package:mini_market_app/cubits/get_all/get_all_cubit.dart';
import 'package:mini_market_app/data/local/db/db.dart';
import 'package:mini_market_app/ui/home/all_products/widgets/product_holder.dart';

import '../../../data/models/product_model/product_model_fields.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  List<ProductModelSql> products = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jami mahsulotlar"),
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<GetAllCubit, GetAllState>(
        builder: (context, state) {
          products = state.products;
          return ListView.separated(
            padding: EdgeInsets.all(24.w),
            itemBuilder: (BuildContext context, int index) {
              debugPrint("PR: ${products[index].name}");
              return Dismissible(
                key: ValueKey(products[index]),
                onDismissed: (direction){
                  context.read<GetAllCubit>().deleteProduct(products[index]);
                },
                direction: DismissDirection.endToStart,
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.white, Colors.red])
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: null, icon: Icon(Icons.delete, color: Colors.blueGrey,))
                    ],
                  ),
                ),
                child: ProductHolder(productModelSql: products[index]),
                // child: ListTile(
                //   // leading: Text("\$ ${products[index].price}"),
                //   leading: Text("${products[index].count} ta"),
                //   title: Text(products[index].name, ),
                //   subtitle: Text(products[index].qrCode),
                //   // subtitle: Text("\$ ${products[index].price}"),
                //   trailing: Text("Price: ${products[index].price}"),
                // ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 8.h,);
            },
            itemCount: products.length,
          );
        }, listener: (BuildContext context, GetAllState state) {

      },
      ),
    );
  }
}
