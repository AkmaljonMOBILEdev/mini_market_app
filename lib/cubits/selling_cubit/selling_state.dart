part of 'selling_cubit.dart';

@immutable
abstract class SellingState {}

class SellingInitial extends SellingState {}
class NoSellingProduct extends SellingState {}
class ProductIsSold extends SellingState {}
