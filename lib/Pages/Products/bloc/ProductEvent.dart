
import 'package:equatable/equatable.dart';




abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductInitial extends ProductEvent {}
class UpdateData extends ProductEvent {}




