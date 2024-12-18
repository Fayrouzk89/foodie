import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realstic/Utils/CommonConstants.dart';
import 'package:realstic/Utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../Common/Poduct.dart';
import '../../../../Utils/AppFonts.dart';
import 'CustomImage.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCardState createState() {
    return _ProductCardState();
  }
}

class _ProductCardState extends State<ProductCard> {
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
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child:  Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: CommonConstants.getCartWidth(),
                          child:  CustomImage(
                            "",
                            width:CommonConstants.getCartWidth(),
                            height:CommonConstants.getCartWidth(),
                            radius: 10, alternatePath: 'assets/images/product.png',
                          ),
                        ),


                      ],
                    ),
                  ),
                 SizedBox(width: 5,),
                 // Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name!,
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                      Text(
                       widget.product.description!,
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                      Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  'اسم المطعم',
                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: primaryColor),
                                ),
                                Text(
                                  "ريال 55.66",
                                  style: TextStyle(overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50,),
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
                                  borderRadius: BorderRadius.circular(20), // Rounded corners
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5), // Adjust padding
                              ),
                              child: Text(
                                "add_product_to_cart".tr(),
                                  style: AppFonts.fontBoldSmall.copyWith(color: primaryColor)
                              ),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                  SizedBox(width: 5,),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}