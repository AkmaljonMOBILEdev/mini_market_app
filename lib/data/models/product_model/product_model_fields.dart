
class ProductFields {
  static const String id = "_id";
  static const String name = "name";
  static const String count = "count";
  static const String price = "price";
  static const String qrCode = "qr_code";

  static const String productsTable = "my_products";
}

class ProductModelSql {
  int? id;
  final String name;
  final int count;
  final int price;
  final String qrCode;

  ProductModelSql({
    this.id,
    required this.name,
    required this.count,
    required this.price,
    required this.qrCode,
  });

  ProductModelSql copyWith({
    String? name,
    int? price,
    int? count,
    String? qrCode,
    int? id,
  }) {
    return ProductModelSql(
      name: name ?? this.name,
      count: count ?? this.count,
      price: price ?? this.price,
      qrCode: qrCode ?? this.qrCode,
      id: id ?? this.id,
    );
  }

  factory ProductModelSql.fromJson(Map<String, dynamic> json) {
    return ProductModelSql(
      name: json[ProductFields.name] ?? "",
      count: json[ProductFields.count] ?? 0,
      price: json[ProductFields.price] ?? 0,
      qrCode: json[ProductFields.qrCode] ?? "",
      id: json[ProductFields.id] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ProductFields.name: name,
      ProductFields.count: count,
      ProductFields.price: price,
      ProductFields.qrCode: qrCode,
    };
  }

  @override
  String toString() {
    return '''
      name: $name
      phone: $count
      price: $price
      qrCode: $qrCode
      id: $id, 
    ''';
  }
}
