import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:realstic/Utils/AppFonts.dart';
import 'package:realstic/Utils/CommonConstants.dart';
import '../../../../Common/Poduct.dart';
import '../../../../Utils/style.dart';

class ProductCardMini extends StatefulWidget {
  final Product product;
  ProductCardMini({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCardMiniState createState() {
    return _ProductCardMiniState();
  }
}

class _ProductCardMiniState extends State<ProductCardMini> {
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
    return Container(
     // height: 600,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/product.png",
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text(
                        "الأكثر مبيعاً",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name!,
                        style: AppFonts.fontBoldSmall.copyWith(overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        widget.product.price!,
                        style: AppFonts.fontRegularSmall.copyWith(overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  const SizedBox(height: 1,),
                  Container(
                    height: CommonConstants.btnHeight,
                    child: OutlinedButton(
                                            onPressed: () {
                        // Define your action here
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white, // White background
                        side: BorderSide(color: primaryColor, width: 1), // Primary border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(CommonConstants.raduis), // Rounded corners
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2), // Adjust padding
                      ),
                      child: Text(
                        "add_to_cart".tr(),
                        style: AppFonts.fontBoldSmall.copyWith(color: primaryColor), // Text in primary color
                      ),
                    ),
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}