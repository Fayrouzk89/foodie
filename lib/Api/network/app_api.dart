import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../Helper/PreferenceSettingsHelper.dart';
import 'app_consts.dart';
import 'constants.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServicesClient{
  // _AppServicesClient created using retrofit
  factory AppServicesClient(Dio dio,String baseUrl)= _AppServicesClient;


  @GET("")
  Future<dynamic> CallDynamic(String url,int type);
  @POST("")
  Future<dynamic> CallPostDynamic(String url,int type,body);



}