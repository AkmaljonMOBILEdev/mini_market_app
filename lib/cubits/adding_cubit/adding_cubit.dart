import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_market_app/data/local/db/db.dart';
import 'package:mini_market_app/data/models/product_model/product_model_fields.dart';
import 'package:mini_market_app/utils/ui_utils/loading_dialog.dart';

part 'adding_state.dart';

class AddingCubit extends Cubit<AddingState> {
  AddingCubit() : super(const AddingState(name: "", count: 0, price: 0, qrCode: ''));

  scanProduct(String qr) {
    emit(state.copyWith(qrCode: qr));
  }

  addName({required String name}){
    emit(state.copyWith(name: name));
  }
  addCount({required int count}){
    emit(state.copyWith(count: count));
  }
  addPrice({required int price}){
    emit(state.copyWith(price: price));
  }

  addProduct({required BuildContext context}) async {
    showLoading(context: context);
    debugPrint("SSSS: ${state.name}, ${state.count}");
    ProductModelSql the = await LocalDatabase.addProduct(ProductModelSql(
      name: state.name,
      count: state.count,
      price: state.price,
      qrCode: state.qrCode,
    ));
    if (context.mounted) hideLoading(context: context);
  }
}
