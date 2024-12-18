
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:realstic/Common/Poduct.dart';
import 'package:realstic/Common/Restaurant.dart';
import 'package:realstic/Common/UserInfo.dart';
import 'package:realstic/Helper/MessageHelper.dart';
import 'package:realstic/Helper/PrefConsts.dart';
import '../Api/apiBody/AuthBody.dart';
import '../Api/apiBody/RegisterBody.dart';
import '../Api/apiBody/loginBody.dart';
import '../Api/apiResponse/AuthResponse.dart';
import '../Api/apiResponse/FailureResponse.dart';
import '../Api/apiResponse/LoginResponse.dart';
import '../Api/apiResponse/SignUpResponse.dart';
import '../Api/network/app_consts.dart';
import '../Api/network/faiure.dart';
import '../Api/network/repository.dart';
import 'package:easy_localization/easy_localization.dart';

import '../Helper/PreferenceSettingsHelper.dart';
import '../Helper/SharedHelper.dart';
class HomeUseCase {
  final Repository _repository;

  HomeUseCase(this._repository);
  Future<List<Restaurant>> executeGetRest() async {
    Either<Failure, dynamic>result = await _repository.CallDynamic(AppConsts.restaurants, 4);
    if (result.isLeft()) {
      int x=1;
      Failure left = (result as Left).value;
      if(left.message!=null)
      {
        RegExp regExp = RegExp(r":\s*(.*?)\}");

        // Match the pattern in the input string
        Match? match = regExp.firstMatch(left.message);

        // Extract and print the result if a match is found
        if (match != null) {
          String result = match.group(1) ?? '';
          MessageHelper.showMessageWithoutContext(result);
          print(result); // Output: No active account found with the given credentials
        } else {
          MessageHelper.showMessageWithoutContext(left.message);
        }

      }
    }
    else {
      dynamic right=(result as Right).value;
      dynamic jsonData = json.encode(right);
      List<dynamic> jsonList = json.decode(jsonData);

      // Convert the JSON list into a list of Restaurant objects
      List<Restaurant> restaurants = jsonList.map((json) => Restaurant.fromJson(json)).toList();

      return restaurants;
    }

    return [];
  }
  Future<List<Product>> executeGetProducts() async {
    Either<Failure, dynamic>result = await _repository.CallDynamic(AppConsts.restaurantsproducts, 4);
    if (result.isLeft()) {
      int x=1;
      Failure left = (result as Left).value;
      if(left.message!=null)
      {
        RegExp regExp = RegExp(r":\s*(.*?)\}");

        // Match the pattern in the input string
        Match? match = regExp.firstMatch(left.message);

        // Extract and print the result if a match is found
        if (match != null) {
          String result = match.group(1) ?? '';
          MessageHelper.showMessageWithoutContext(result);
          print(result); // Output: No active account found with the given credentials
        } else {
          MessageHelper.showMessageWithoutContext(left.message);
        }

      }
    }
    else {
      dynamic right=(result as Right).value;
      dynamic jsonData = json.encode(right);
      List<dynamic> jsonList = json.decode(jsonData);

      // Convert the JSON list into a list of Restaurant objects
      List<Product> restaurants = jsonList.map((json) => Product.fromJson(json)).toList();

      return restaurants;
    }

    return [];
  }


}
