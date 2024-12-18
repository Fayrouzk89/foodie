import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:realstic/Utils/AppFonts.dart';
import '../../Routes/Routes.dart';
import '../../Routes/navigation.dart';
import '../../Utils/CommonConstants.dart';
import '../../Utils/sizes_consts.dart';
import '../../Utils/style.dart';
import '../../Widget/ButtonWidget.dart';
import 'FooterWidget1.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
     // shrinkWrap: true,
     // padding: EdgeInsets.symmetric(horizontal: 10.0),
      children: [
        Image.asset('assets/images/img_auth.png',
            width: double.infinity, height: 400, fit: BoxFit.fill),
        Text(
          "welcome".tr(),
          textAlign: TextAlign.center,
          style: AppFonts.fontBoldLarge,
        ),
        const SizedBox(height: 10.0),
        Text(
          "title".tr(),
          textAlign: TextAlign.center,
          style: AppFonts.fontRegularMeduim.copyWith(color: greyColor)
        ),
        ButtonWidget(
          onPress: () => onPressButton(),
          title: 'start_now'.tr(),
          buttonColor: primaryColor,
          titleColor: whiteColor,
          borderColor: primaryColor,
          paddingHorizontal: 20.0,
          paddingVertical:
          SizesConstant.verticalButtonPad,
          size: 0,
        ),
        const SizedBox(height: 10.0),
        FooterWidget1()
      ],
    );
  }
  onPressButton()async
  {
    Navigator.pushNamed(
      Navigation.getContext(),
      Routes.homeScreen,
    );

  }
}