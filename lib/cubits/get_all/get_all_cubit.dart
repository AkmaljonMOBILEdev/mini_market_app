import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_market_app/data/local/db/db.dart';
import '../../data/models/product_model/product_model_fields.dart';

part 'get_all_state.dart';

class GetAllCubit extends Cubit<GetAllState> {
  GetAllCubit() : super(GetAllState(products: [])){
    getAll();
  }
  deleteProduct(ProductModelSql productModelSql)async{
    int? t = await LocalDatabase.deleteProduct(productModelSql.id!);
    debugPrint("DELETED: $t");
    getAll();
  }
  getAll()async{
    List<ProductModelSql> newOnes = await LocalDatabase.getAllProducts();
    emit(state.copyWith(newOnes));
  }
}
