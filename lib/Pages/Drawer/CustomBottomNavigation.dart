import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../Routes/Routes.dart';
import '../../../Routes/navigation.dart';
import '../../Helper/LocalDataHelper.dart';
import '../../Utils/style.dart';
class CustomBottomNavigation extends StatefulWidget {
  var state;
  final int currentTabIndex;
  CustomBottomNavigation(this.currentTabIndex) : super();

  @override
  _PageState createState() {
    state = _PageState();
    return state;
  }
}
class _PageState extends State<CustomBottomNavigation> {
  int currentTabIndex=0;

  @override
  void initState() {

    super.initState();

    currentTabIndex = widget.currentTabIndex;
    WidgetsBinding.instance.addPostFrameCallback((_){
      call;
    });
  }
  call()
  {
    print("current index is "+currentTabIndex.toString());
    LocalDataHelper.currentPageNotifier.value= widget.currentTabIndex;
    setState(() {

    });
  }
  Widget build(BuildContext context) {
    return
      ValueListenableBuilder<int>(
        valueListenable: LocalDataHelper.currentPageNotifier,
        builder: (BuildContext context, int value,child) {
          return BottomNavigationBar(
            currentIndex: value,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: primaryColor,
            showUnselectedLabels: true,
            selectedItemColor: Colors.white,// this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                label: 'dashboard'.tr(),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt),
                  label: 'products'.tr()),
              BottomNavigationBarItem(

                  icon: new Icon(Icons.search),
                  label: 'search'.tr()),

              BottomNavigationBarItem(
                  icon: Icon(Icons.card_travel),
                  label: 'cart'.tr())
            ],
            onTap: onItemTapped,
          );
        },
      );
  }
  void onItemTapped(int index) {
    setState(() {
      currentTabIndex = index;
      switch(currentTabIndex) {
        case 0: {
          openDashBoard(context);
        }
        break;
        case  1: {
          openProducts(context);
        }
        break;
        case  2: {
          openSearch(context);
        }
        break;
        case  3: {
          currentTabIndex=3;
          openCart(context);

        }
        break;

        default: {
          openDashBoard(context);
        }
        break;
      }
    });
  }
  static void openDashBoard(BuildContext context)
  {
    LocalDataHelper.currentPageNotifier.value=0;
    Navigator.pushNamed(
      Navigation.getContext(),
      Routes.homeScreen,
    );
  }
  static void openProducts(BuildContext context)
  {
    LocalDataHelper.currentPageNotifier.value=1;
    Navigator.pushNamed(
      Navigation.getContext(),
      Routes.productScreen,
    );
  }
  static void openSearch(BuildContext context)
  {
    LocalDataHelper.currentPageNotifier.value=2;
    Navigator.pushNamed(
      Navigation.getContext(),
      Routes.searchScreen,
    );
  }
  static void openCart(BuildContext context)
  {
    LocalDataHelper.currentPageNotifier.value=3;
    Navigator.pushNamed(
      Navigation.getContext(),
      Routes.cartScreen,
    );
  }


}


