part of 'get_all_cubit.dart';

class GetAllState extends Equatable{
  final List<ProductModelSql> products;

  const GetAllState({required this.products});

  GetAllState copyWith(
      List<ProductModelSql>? products
      ){
    return GetAllState(products: products ?? this.products);
  }

  @override
  List<Object?> get props => [products];
}

