
import 'package:equatable/equatable.dart';
import 'package:realstic/Common/Restaurant.dart';

import '../../../Common/Poduct.dart';



abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class DataLoading extends ProductState {}
class DataLoaded extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> Model;
  const ProductLoaded(this.Model);
}

class ProductError extends ProductState {
  final String? message;
  const ProductError(this.message);
}
