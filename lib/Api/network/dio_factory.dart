import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'app_consts.dart';
import 'constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



class DioFactory {



  DioFactory();


  final int _timeout = 20 * 1000;


  Future<Dio> getDio() async {
    String getAuth()
    {
      String username = AppConsts.phenix_user;
      String password = AppConsts.phenix_password;
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$username:$password'));
      return basicAuth;
    }
    final Map<String, dynamic> _headers = {
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
      'Accept': "application/json; charset=utf-8",
      'Content-Type': 'application/json; charset=UTF-8',
      "authorization": getAuth()
    };

    Dio dio = Dio();
    dio.options = BaseOptions(
      headers: _headers,
      receiveTimeout: Constants.apiTimeOut,
      sendTimeout: Constants.apiTimeOut,
      baseUrl: Constants.baseUrl,
    );

    if(!kReleaseMode){
      dio.interceptors.add(PrettyDioLogger(
        requestHeader : true,
        requestBody : true,
        responseHeader : true,));
    }
    return dio;
  }
}