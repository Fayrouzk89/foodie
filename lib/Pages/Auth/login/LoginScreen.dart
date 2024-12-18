import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realstic/Helper/AppLoading.dart';
import 'package:realstic/Pages/Auth/AuthController.dart';
import 'package:realstic/Utils/AppFonts.dart';

import '../../../Common/UserInfo.dart';
import '../../../Routes/Routes.dart';
import '../../../Routes/navigation.dart';
import '../../../Utils/CommonConstants.dart';
import '../../../Utils/sizes_consts.dart';
import '../../../Utils/style.dart';
import '../../../Widget/ButtonWidget.dart';
import '../../../Widget/CommonWidget.dart';
import '../../../Widget/CustomInput.dart';
import '../FooterWidget.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthController authController=AuthController();
  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: whiteBack,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: CommonConstants.paddingBottom),
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(
                      horizontal: CommonConstants.paddingHorizontal),
                  child: _buildForms(context),
                ),
              ),
              FooterWidget()
            ],
          ),
        ),
      ],
    );
  }

  void onClick() {}

  Widget _buildForms(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40,),
            Image.asset('assets/images/logo_app.png',
                width: double.infinity, height: 100, fit: BoxFit.contain),
            CommonWidget.rowHeight(height: 10),
            Text(
              "welcome".tr(),
              textAlign: TextAlign.center,
              style: AppFonts.fontBoldLarge
            ),
            Text(
              "app_name".tr(),
              textAlign: TextAlign.center,
              style: AppFonts.fontBoldLarge.copyWith(color: primaryColor),
            ),
            CommonWidget.rowHeight(height: 20),
            CustomInput(lable: 'mobile'.tr(), validator: 'required'.tr(), Controller: _usernameController,keyboardType: TextInputType.phone, obscureText: false, icon: Icons.phone_android,
              formats:  <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(CommonConstants.phoneLength),
              ],),
            CommonWidget.rowHeight(height: 20),
            CustomInput(lable: 'password'.tr(), validator: 'required'.tr(), Controller: _passwordController,keyboardType: TextInputType.text,obscureText: true, icon: Icons.lock, formats: [],),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  Navigation.getContext(),
                  Routes.forgetPasswordScreen,
                );
              },
              child: Text(
                'forget_password'.tr(),
                textAlign: TextAlign.end,
                style: AppFonts.fontBoldSmall.copyWith(color: textColor),
              ),
            ),
            CommonWidget.rowHeight(height: 10),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    horizontal: CommonConstants.horizontalPaddingButton,
                    vertical: CommonConstants.verticalPaddingButton),
                child: ButtonWidget(
                  onPress: () => doLogin(),
                  title: 'sign_in'.tr(),
                  buttonColor: primaryColor,
                  titleColor: whiteColor,
                  borderColor: primaryColor,
                  paddingHorizontal: 20.0,
                  paddingVertical:
                  SizesConstant.verticalButtonPad,
                  size: 0,
                )
            ),
            CommonWidget.rowHeight(height: 10),


          ],
        ),
      ),
    );
  }

  void doLogin() async {
    if (_formKey.currentState!.validate())
    {
    UserInfo userInfo = UserInfo(
        id: 0,
        email: '',
        mobile: "",
        password: _passwordController.text.toString().trim(),
        user_name: CommonConstants.formatPhoneNumber(_usernameController.text.toString().trim()),
       );
    AppLoading.setLoading("please_wait".tr());
    bool res= await authController.validateUser(userInfo);
    AppLoading.hideLoading();
    if(res)
      {
        Navigator.pushNamed(
          Navigation.getContext(),
          Routes.homeScreen,
        );
      }
    }


  }
}
