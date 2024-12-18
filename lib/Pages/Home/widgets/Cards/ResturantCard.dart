import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realstic/Utils/AppFonts.dart';
import 'package:realstic/Utils/style.dart';

import '../../../../Common/Restaurant.dart';
import 'package:easy_localization/easy_localization.dart';

class RestaurantCard extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  _RestaurantCardState createState() {
    return _RestaurantCardState();
  }
}

class _RestaurantCardState extends State<RestaurantCard> {
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
                  "assets/images/rest.jpg",
                  height: 150,
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
                    child:  Text(
                      "20% off",
                      style: AppFonts.fontBoldSmall.copyWith(color: Colors.white)
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.restaurant.arName!,
                            style: AppFonts.fontBoldSmall
                          ),
                          Text(
                            widget.restaurant.description!,
                            softWrap: true,
                            maxLines: 2,
                            style: AppFonts.fontRegularSmall.copyWith(overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // Background color of the button
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),  // Makes the container round
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite_border,color: primaryColor,),
                        )),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.account_balance,color: primaryColor,size: 20,),
                        const SizedBox(width: 2,),
                        Text(widget.restaurant.address!,softWrap: true,style: AppFonts.fontRegularSmall,),
                      ],
                    ),
                   if( widget.restaurant.isOpen!=null && widget.restaurant.isOpen!)
                    Text("is_open".tr(),style: AppFonts.fontBoldSmall.copyWith(color: primaryColor),),
                  ],
                )
              ],
            ),
          ),


        ],
      ),
    );
  }
}