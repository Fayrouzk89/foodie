import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:realstic/Common/Restaurant.dart';

import '../../../Routes/PageConsts.dart';
import '../../../Routes/Routes.dart';
import '../../../Routes/navigation.dart';
import '../DashBoardHelper.dart';
import 'DashBoardEvent.dart';
import 'DashBoardState.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {


  DashBoardBloc() : super(DashBoardInitial()) {

    on<GetDashBoardInitial>((event, emit) async {
      try {
        emit(CovidLoading());
        List<Restaurant>rest=await DashBoardHelper.getDashBoardRest();
        emit(DashBoardLoaded(rest));
      }  catch(l) {
        emit(CovidError("Failed to fetch data"));
      }
    });}


}