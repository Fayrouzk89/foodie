import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:realstic/Common/Restaurant.dart';

import '../../../Common/Poduct.dart';
import '../../../Routes/PageConsts.dart';
import '../../../Routes/Routes.dart';
import '../../../Routes/navigation.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import '../../Home/DashBoardHelper.dart';
import 'ProductEvent.dart';
import 'ProductState.dart';
class ProductBloc extends Bloc<ProductEvent, ProductState> {


  ProductBloc() : super(ProductInitial()) {

    on<GetProductInitial>((event, emit) async {
      try {
        emit(ProductLoading());
        List<Product>rest=await DashBoardHelper.getDashBoardProduct();
        emit(ProductLoaded(rest));
      }  catch(l) {
        emit(ProductError("Failed to fetch data"));
      }
    });}


}