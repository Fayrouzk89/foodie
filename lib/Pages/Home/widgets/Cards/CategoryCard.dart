
import 'package:flutter/material.dart';
import 'package:realstic/Utils/AppFonts.dart';
import 'package:realstic/Utils/CommonConstants.dart';
import 'package:realstic/Utils/style.dart';

import '../../../../Common/Category.dart';
import '../../../../Utils/SizeConfig.dart';


class CategoryCard extends StatelessWidget {
  final Category product;

  //final Function? onTap;
  CategoryCard( this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        decoration: BoxDecoration(
          //  border: Border.all(color: Color(0xffeeeeee), width: 2.0),
          //color: Colors.white38,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        margin: EdgeInsets.all(1),
        //height: ColorConstants.categoryHeight,
        width: SizeConfig().screenWidth*CommonConstants.categoryWidth,
        height: SizeConfig().screenWidth*CommonConstants.categoryWidth+5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Container(
              height: SizeConfig().screenWidth*CommonConstants.categoryWidth,
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: SizeConfig().screenWidth*CommonConstants.categoryWidth,
                  child:  CircleAvatar(
                    radius:SizeConfig().screenWidth*CommonConstants.categoryWidth,
                    backgroundImage: AssetImage(product.images),
                    backgroundColor: Colors.transparent,
                  )
              ),
            ),
            Text(
              (product!.name),
              textAlign: TextAlign.center,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.fontRegularSmall,)
          ],
        ),
      ),
    );
  }


}
