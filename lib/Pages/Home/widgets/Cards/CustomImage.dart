import 'package:flutter/material.dart';

import '../../../../Utils/style.dart';




class CustomImage extends StatelessWidget {
  const CustomImage(this.items,
      {this.width = 100,
        required this.height ,
        this.bgColor,
        this.borderWidth = 0,
        this.borderColor,
        this.trBackground = false,
        this.isNetwork = true,
        this.radius = 50, required this.alternatePath});

  final String items;
  final double width;
  final double height;
  final double borderWidth;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final double radius;
  final String alternatePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:
       /*
      (items!=null && items!="")?
      BoxDecoration(
        border: Border.all(color: borderColor ?? cardColor, width: borderWidth),
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 2), // changes position of shadow
          ),
        ],
        image:
        DecorationImage(image: MemoryImage(items!), fit: BoxFit.cover),
      ):

        */
      BoxDecoration(
        border: Border.all(color: borderColor ?? cardColor, width: borderWidth),
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 2), // changes position of shadow
          ),
        ],
        image:
        DecorationImage(image: AssetImage(alternatePath), fit: BoxFit.fill),
      )
      ,
    );
  }
}