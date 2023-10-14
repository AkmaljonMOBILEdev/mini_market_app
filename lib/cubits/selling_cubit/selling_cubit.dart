import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:mini_market_app/data/local/db/db.dart';
import 'package:mini_market_app/data/models/product_model/product_model_fields.dart';

part 'selling_state.dart';

class SellingCubit extends Cubit<SellingState> {
  SellingCubit() : super(SellingInitial());

  checkProduct(){
    emit(NoSellingProduct());
  }

  productIsSold(String qr)async{
    ProductModelSql productModelSql = await LocalDatabase.getSingleProduct(qr);
    debugPrint("Checker product qr code: ${productModelSql.qrCode}");
    if(qr==productModelSql.qrCode){
      emit(ProductIsSold());
    }else{
      emit(NoSellingProduct());
    }

    productModelSql.copyWith(count: productModelSql.count-1);
    await LocalDatabase.updateProduct(productModelSql: productModelSql);
  }
}
