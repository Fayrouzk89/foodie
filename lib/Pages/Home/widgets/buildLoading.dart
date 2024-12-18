import 'package:flutter/material.dart';
import 'package:realstic/Utils/style.dart';
import 'package:easy_localization/easy_localization.dart';

class buildLoading extends StatelessWidget {
  buildLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          strokeWidth: 2.0,
        ),
        SizedBox(height: 20),
        Text(
          "Loading".tr(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
