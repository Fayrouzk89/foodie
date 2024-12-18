import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:realstic/Common/UserInfo.dart';
import 'package:realstic/Helper/PrefConsts.dart';

import '../Common/Category.dart';
import 'PreferenceSettingsHelper.dart';
import 'SharedHelper.dart';
class LocalDataHelper
{
  static String mobile="";
  static UserInfo? userInfo;
  static ValueNotifier<int> currentPageNotifier=ValueNotifier(0);

  static String lang="ar";
  static Future<bool> isUserExists()async
  {
    /*

    PreferenceSettingsHelper? preferenceSettingsHelper=await SharedHelper.getHelper();
    LocalDataHelper.phenixUser= await preferenceSettingsHelper!.loadSettings();
    if(LocalDataHelper.phenixUser!=null && LocalDataHelper.phenixUser!.userName!=null
        && LocalDataHelper.phenixUser!.userName!="" &&  LocalDataHelper.phenixUser!.password!=null&&LocalDataHelper.phenixUser!.password!="")
    {
      return true;
    }

     */
    PreferenceSettingsHelper? preferenceSettingsHelper=await SharedHelper.getHelper();
    final sharedPreferences =await preferenceSettingsHelper.sharedPreferences;
    bool isLogin =sharedPreferences.getBool(PrefConsts.isLogin)??false;
    if(isLogin)
      {
        UserInfo userInfo=UserInfo(id: 1, user_name: "user_name", email: "email", mobile: "mobile", password: "password");
        userInfo.refresh=sharedPreferences.getString(PrefConsts.refresh)??"";
        userInfo.access=sharedPreferences.getString(PrefConsts.access)??"";
        LocalDataHelper.userInfo=userInfo;
        return true;
      }
    else
    return false;
  }
  static List<Category> getCategories()
  {
    List<Category>categories=[];
    Category category=Category("البرغر", "assets/cats/1.png");
    categories.add(category);
    category=Category("الحلويات", "assets/cats/2.png");
    categories.add(category);
    category=Category("السوشي", "assets/cats/3.png");
    categories.add(category);
    category=Category("الباستا", "assets/cats/4.png");
    categories.add(category);
    category=Category("اللحوم", "assets/cats/5.png");
    categories.add(category);
    category=Category("المعجنات", "assets/cats/6.png");
    categories.add(category);
    category=Category("البيتزا", "assets/cats/7.png");
    categories.add(category);
    category=Category("المزيد", "assets/cats/more.png");
    category.isMore=true;
    categories.add(category);
    return categories;
  }

}