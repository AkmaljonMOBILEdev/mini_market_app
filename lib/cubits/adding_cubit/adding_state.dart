part of 'adding_cubit.dart';

class AddingState extends Equatable {
  final String name;
  final int count;
  final int price;
  final String qrCode;

  const AddingState({
    required this.name,
    required this.qrCode,
    required this.count,
    required this.price,
  });

  AddingState copyWith({
    String? name,
    int? count,
    int? price,
    String? qrCode,
  }) {
    return AddingState(
      name: name ?? this.name,
      count: count ?? this.count,
      price: price ?? this.price,
      qrCode: qrCode ?? this.qrCode,
    );
  }

  @override
  List<Object?> get props => [name, count, price, qrCode];
}
