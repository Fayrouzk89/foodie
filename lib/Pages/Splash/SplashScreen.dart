import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../Utils/style.dart';
import 'SplashController.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  SplashController? pageController;
  @override
  void initState() {

    pageController=SplashController();

    super.initState();
    pageController!.authenticate(context);


  }



  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;



    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: themeColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              pageController!.openNext(context);
            },
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo/Icon
                Text(
                  'app_name'.tr(),
                  style: TextStyle(
                    fontSize: 18, // Adjust font size as needed
                    fontFamily: sofia,
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // Optional styling
                  ),
                ),

                const SizedBox(width: 10), // Spacing between logo and text
                // Text beside the logo
                Image.asset(
                  'assets/icons/img.png', // Replace with your logo path
                  width: 50, // Adjust size as needed
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      )
    );
  }




}