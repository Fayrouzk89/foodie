import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realstic/Helper/LocalDataHelper.dart';
import 'package:realstic/Utils/AppFonts.dart';
import 'package:realstic/Utils/CommonConstants.dart';
import 'package:realstic/Utils/style.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Utils/sizes_consts.dart';
import '../../Widget/ButtonWidget.dart';
import 'Cards/CartCard.dart';
class CurrentCart extends StatefulWidget {
  CurrentCart({Key? key}) : super(key: key);

  @override
  _CurrentCartState createState() {
    return _CurrentCartState();
  }
}

class _CurrentCartState extends State<CurrentCart> {
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
      children: [
        // Container above the ListView
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: greyColor,
              width: 1.0,
            ),
            borderRadius:BorderRadius.circular(15.0), // Rounded corners
          ),
          child: Column(
            children: [
              Align(
                alignment:(LocalDataHelper.lang=="ar")?Alignment.topLeft: Alignment.topRight, // Align to the bottom-right corner
                child: OutlinedButton(
                  onPressed: () {
                    // Define your action here
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white, // White background
                    side: BorderSide(color: primaryColor, width: 1), // Primary border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Adjust padding
                  ),
                  child: Text(
                    "add_prods".tr()+" +",
                      style: AppFonts.fontBoldSmall.copyWith(color: primaryColor)
                  ),
                ),
              ),
              Container(
                child: ListView.separated(
                  itemCount: 2,
                  separatorBuilder: (context, index) {
                    return Divider( // Line separator
                      color: Colors.grey,
                      thickness: 1.0,
                    );
                  },
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CartCard(isCart: true,);
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        buildBill(),
        const SizedBox(height: 10,),
        Divider(height: 1,color: greyColor),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("pay_by".tr(),style:AppFonts.fontBoldMeduim.copyWith(color: greyColor),),
                  Text("cash",style:AppFonts.fontBoldMeduim.copyWith(color: primaryColor,),)
                ],
              ),
              const Icon(Icons.more_outlined,)
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
                horizontal: CommonConstants.horizontalPaddingButton,
                vertical: CommonConstants.verticalPaddingButton),
            child: ButtonWidget(
              onPress: () => doContinue(),
              title: 'continue'.tr(),
              buttonColor: primaryColor,
              titleColor: whiteColor,
              borderColor: primaryColor,
              paddingHorizontal: 20.0,
              paddingVertical:
              SizesConstant.verticalButtonPad,
              size: 0,
            )
        )
      ],
    );
  }
  doContinue()
  {

  }
  Widget buildBill()
  {
    return  Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: greyColor,
          width: 1.0,
        ),
        borderRadius:BorderRadius.circular(15.0), // Rounded corners
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8),
            child: Text("bill".tr(),style: AppFonts.fontBoldMeduim,),
          ),
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,// Number of items
            itemBuilder: (context, index) {
              return  ListTile(
                title: Text('اسم المنتج ',style: AppFonts.fontRegularSmall,),
                trailing: Text("26.245",style: AppFonts.fontBoldSmall,),
              );
            },
          ),
          Divider(height: 1,color: greyColor),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("total".tr(),style:AppFonts.fontBoldMeduim,),
                Text("46.233".tr(),style:AppFonts.fontBoldMeduim,),
              ],
            ),
          ),
          const SizedBox(height: 5,)

        ],
      ),
    );
  }
}