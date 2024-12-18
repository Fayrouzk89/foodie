import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Helper/LocalDataHelper.dart';
import '../../Routes/Routes.dart';
import '../../Routes/navigation.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
class SplashController
{

  Future<void> authenticate(BuildContext context) async {
   await Future.delayed(Duration(seconds: 4), () {
      print('Delayed code executed');
    });
    openNext(context);
  }
  openNext(BuildContext context)async
  {

    bool result=await LocalDataHelper.isUserExists();
    if(result==false)
    {
      Navigator.pushNamed(
        Navigation.getContext(),
        Routes.scanScreen,
      );
    }
    else
      {
        Navigator.pushNamed(
          Navigation.getContext(),
          Routes.homeScreen,
        );
      }
  }

}