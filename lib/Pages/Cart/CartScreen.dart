import 'package:flutter/material.dart';
import 'package:realstic/Utils/AppFonts.dart';
import 'package:realstic/Utils/style.dart';
import 'package:realstic/Utils/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

import '../Drawer/CustomBottomNavigation.dart';
import 'CurrentCart.dart';
import 'LastCart.dart';
class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() {
    return _CartScreenState();
  }
}

class _CartScreenState extends State<CartScreen> with SingleTickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    setState(() {

    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: new CustomBottomNavigation(3),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (_tabController!=null)?Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("mycart".tr(),style: AppFonts.fontBoldLarge,),
                IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded))
              ],
            ),
            const SizedBox(height: 10,),

            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: primaryColor,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'current_cart'.tr(),
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'last_purchases'.tr(),
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  CurrentCart(),
                  LastCart()

                  // second tab bar view widget
                ],
              ),
            ),
          ],
        ):Container(),
      ),
    );
  }
}