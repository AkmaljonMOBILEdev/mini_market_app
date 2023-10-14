import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/product_model/product_model_fields.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("products.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE ${ProductFields.productsTable} (
    ${ProductFields.id} $idType,
    ${ProductFields.name} $textType,
    ${ProductFields.count} $intType,
    ${ProductFields.price} $intType,
    ${ProductFields.qrCode} $textType
    )
    ''');

    debugPrint("-------DB----------CREATED---------");
  }

  static Future<ProductModelSql> addProduct(
      ProductModelSql productModelSql) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        ProductFields.productsTable, productModelSql.toJson());
    debugPrint("ADDED: ${productModelSql.name}");
    return productModelSql.copyWith(id: id);
  }

  static Future<List<ProductModelSql>> getAllProducts() async {
    List<ProductModelSql> allProducts = [];
    final db = await getInstance.database;
    allProducts = (await db.query(ProductFields.productsTable))
        .map((e) => ProductModelSql.fromJson(e))
        .toList();

    return allProducts;
  }


  static updateProduct({required ProductModelSql productModelSql}) async {
    final db = await getInstance.database;
    db.update(
      ProductFields.productsTable,
      productModelSql.toJson(),
      where: "${ProductFields.id} = ?",
      whereArgs: [productModelSql.id],
    );

  }

  static Future<int> deleteProduct(int id) async {
    final db = await getInstance.database;
    int count = await db.delete(
      ProductFields.productsTable,
      where: "${ProductFields.id} = ?",
      whereArgs: [id],
    );
    return count;
  }

  static Future<ProductModelSql> getSingleProduct(String qr) async {
    List<ProductModelSql> products = [];
    final db = await getInstance.database;
    products = (await db.query(
      ProductFields.productsTable,
      where: "${ProductFields.qrCode} = ?",
      whereArgs: [qr],
    ))
        .map((e) => ProductModelSql.fromJson(e))
        .toList();


    if (products.isNotEmpty) {
      return products.first;
    }
    return ProductModelSql(name: "name", count: 404, price: 404, qrCode: "qrCode");
  }



}
