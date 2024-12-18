import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:realstic/Common/UserInfo.dart';
import 'package:realstic/Helper/MessageHelper.dart';
import 'package:realstic/Helper/PrefConsts.dart';
import '../Api/apiBody/AuthBody.dart';
import '../Api/apiBody/RegisterBody.dart';
import '../Api/apiBody/ResendBody.dart';
import '../Api/apiBody/ResetBody.dart';
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
class SharedUseCase {
  final Repository _repository;

  SharedUseCase(this._repository);
  Future<bool> executeLogin(UserInfo userInfo) async {
    bool res = false;
    loginBody body=loginBody(userInfo.user_name,userInfo.password);
    Either<Failure, dynamic>result = await _repository.CallPostDynamic(AppConsts.login, 1,body);
    if (result.isLeft()) {
      res = false;
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
       else
         {
           MessageHelper.showMessageWithoutContext("error_login_info".tr());
         }
       /*
      FailureResponse left = (result as Left).value;
      SessionHandler.handelErrorMessage(
          left.error ?? "error_registration".tr());

       */
    }
    else {
      LoginResponse right = LoginResponse.fromJson((result as Right).value);
      if(right.success)
        {
          res=true;
          await saveLogin(right);
        }
      else{
        res = false;
        MessageHelper.showMessageWithoutContext(right.detail!);
      }
    }

    return res;
  }
 Future<bool> executeRegister(UserInfo userInfo) async
  {
    bool res = false;
    RegisterBody body=RegisterBody(userInfo.email,userInfo.mobile,userInfo.user_name,userInfo.password);
    Either<Failure, dynamic>result = await _repository.CallPostDynamic(AppConsts.register, 2,body);
    if (result.isLeft()) {
      res = false;
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
      else
      {
        MessageHelper.showMessageWithoutContext("error_signUp_info".tr());
      }
      /*
      FailureResponse left = (result as Left).value;
      SessionHandler.handelErrorMessage(
          left.error ?? "error_registration".tr());

       */
    }
    else {

      SignUpResponse right = SignUpResponse.fromJson((result as Right).value);
      if(right.success)
      {
        res=true;

      }
      else{
        res = false;

        MessageHelper.showMessageWithoutContext("error_signUp_info".tr());
      }


    }

    return res;
  }
  Future<bool> authUser(String code,String phone) async
  {
    bool res = false;
    AuthBody body=AuthBody(code, phone);
    Either<Failure, dynamic>result = await _repository.CallPostDynamic(AppConsts.verify, 3,body);
    if (result.isLeft()) {
      res = false;
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
      else
      {
        MessageHelper.showMessageWithoutContext("error_auth_info".tr());
      }
    }
    else {

      AuthResponse right = AuthResponse.fromJson((result as Right).value);
      if(right.success)
      {
       if(right.message!.contains("activated"))
        res=true;
       else
         {
           MessageHelper.showMessageWithoutContext(right.message!);
         }

      }
      else{
        res = false;

        MessageHelper.showMessageWithoutContext("error_auth_info".tr());
      }
    }

    return res;
  }
  Future<bool> resetPassword(String phone,String code,String password) async
  {
    bool res = false;

    ResetBody body=ResetBody(phone,password,code);
    Either<Failure, dynamic>result = await _repository.CallPostDynamic(AppConsts.reset, 3,body);
    if (result.isLeft()) {
      res = false;
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
      else
      {
        MessageHelper.showMessageWithoutContext("error_auth_info".tr());
      }
    }
    else {

      AuthResponse right = AuthResponse.fromJson((result as Right).value);
      if(right.success)
      {
        if(right.message!.contains("activated"))
          res=true;
        else
        {
          MessageHelper.showMessageWithoutContext(right.message!);
        }

      }
      else{
        res = false;

        MessageHelper.showMessageWithoutContext("error_auth_info".tr());
      }
    }



    return res;
  }

  resetUserPassword(String phone) async
  {
    bool res = false;

    ResendBody body=ResendBody(phone);
    Either<Failure, dynamic>result = await _repository.CallPostDynamic(AppConsts.resend_auth_code, 3,body);
    if (result.isLeft()) {
      res = false;
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
      else
      {
        MessageHelper.showMessageWithoutContext("error_send_code".tr());
      }
    }
    else {


    }
  }
  resendCode(String phone) async
  {

  }

  saveLogin( LoginResponse right)async
  {
    PreferenceSettingsHelper preferenceSettingsHelper=await SharedHelper.getHelper();
    final sharedPreferences =await preferenceSettingsHelper.sharedPreferences;
    sharedPreferences.setString(PrefConsts.refresh, right.refresh!);
    sharedPreferences.setString(PrefConsts.access, right.access!);
    sharedPreferences.setBool(PrefConsts.isLogin, true);
    sharedPreferences.commit();
  }
  /*
  Future<bool> executeOpenSession(int companyId,int branchId,String userName,String password,BuildContext context) async{

    bool res=false;
    Either<Failure, ApiResponse<SessionResponse>>result= await _repository.openSession( companyId, branchId, userName, password);
    if(result.isLeft())
    {
      res=false;
      Failure left=(result as Left).value;
      print("Message Session" +left.message);
      SessionHandler.handelErrorMessage(left.message);
    }
    else {
      ApiResponse<SessionResponse> right=(result as Right).value;
      if (right.result != null && right.result!.length > 0) {
        if (right.result[0].result == AppConsts.success) {
          AppConsts.sessioId = right.result[0].session;
          res = true;
        }
        else if (right.result[0].errorcode != -1) {
          if (right.result[0].errorcode == AppConsts.error_code_not_licenced || (right.result[0].errorcode == AppConsts.error_code_not_licenced2)) {
            SessionHandler.displayRegisterDevice(context);
          }
          else if (right.result[0].value != null) {
            SessionHandler.handelErrorMessage(right.result[0].value!);
          }
          res = false;
        }
      }
    }
    return res;
  }

   */
  /*
  Future<bool> executeRegistration() async {
    bool res = false;
    Either<FailureResponse,
        ApiResponse<RegistrationResponse>>result = await _repository
        .registerDeviceCloud();
    if (result.isLeft()) {
      res = false;
      FailureResponse left = (result as Left).value;
      SessionHandler.handelErrorMessage(
          left.error ?? "error_registration".tr());
    }
    else {
      ApiResponse<RegistrationResponse> right = (result as Right).value;
      if (right.result != null && right.result!.length > 0) {

        res= await ResponseHandler.registrationResultApi(right.result[0]);
      }
    }

    return res;
  }

   */
}
