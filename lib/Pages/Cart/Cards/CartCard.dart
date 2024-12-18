import 'package:flutter/material.dart';
import 'package:realstic/Utils/AppFonts.dart';

import '../../../Utils/style.dart';
import 'package:easy_localization/easy_localization.dart';

class CartCard extends StatefulWidget {
  final bool isCart;
  CartCard({Key? key, required this.isCart}) : super(key: key);

  @override
  _CartCardState createState() {
    return _CartCardState();
  }
}

class _CartCardState extends State<CartCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int qty = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // height: 114,
      padding: EdgeInsets.only(left: 6, top: 10, bottom: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    height: 82,
                    width: 82,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 10.0,
                          offset: Offset(2, 2),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage("assets/images/product.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      '1x',
                      style: AppFonts.fontRegularSmall.copyWith(color: Colors.white)
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "اسم المنتج",
                    style: AppFonts.fontBoldMeduim,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "category_prod".tr() + ": ",
                        style: AppFonts.fontBoldMeduim
                            .copyWith(color: primaryColor),
                      ),
                      Text(
                        "اسم الفئة",
                        style: AppFonts.fontRegularMeduim,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  widget.isCart?
                  Text(
                    "45.123 ريال",
                    style: AppFonts.fontRegularMeduim,
                  ):Text(
                    "تاريخ الشراء",
                    style: AppFonts.fontRegularMeduim,
                  ),
                  if(!widget.isCart)
                    buildBill()
                ],
              ),
            ],
          ),
          (widget.isCart)?
              buildCart():
              Container()
        ],
      ),
    );
  }
  Widget buildContainer(int num)
  {
    return
      (num==2)?
      Icon(
        (num==1)? Icons.add:Icons.remove_circle_outline, // Icon to display
        color: primaryColor, // Icon color
        size: 35, // Icon size
      ):
      Icon(
        (num==1)? Icons.add_circle:Icons.remove_circle_outline, // Icon to display
        color: primaryColor, // Icon color
        size: 35, // Icon size
      );
      Container(
      width: 40, // Width of the circle
      height: 40, // Height of the circle (same as width for a perfect circle)
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Circular shape
        color: Colors.white, // Background color
        border: Border.all(
          color: primaryColor, // Border color
          width: 3.0, // Border width
        ),
      ),
      child: Icon(
        (num==1)? Icons.add:Icons.remove_circle_outline, // Icon to display
        color: primaryColor, // Icon color
        size: 20, // Icon size
      ),
    );
  }

  void function1() {
    qty = qty + 1;
    setState(() {});
  }

  void function2() {
    qty = qty - 1;
    setState(() {});
  }

 Widget buildBill() {
    return Row(
     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "45.123 ريال",
          style: AppFonts.fontRegularMeduim,
        ),
        SizedBox(width: 20,),
        OutlinedButton(
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
        )

      ],
    );
 }

 Widget buildCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(6),
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: function2,
                  child: buildContainer(2)
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                  height: 30,
                  width: 30,
                  child: Center(
                      child: Text(
                        qty.toString(),
                        style: TextStyle(fontSize: 18),
                      ))),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: function1,
                child:buildContainer(1),)
              /*
                      Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        height: 30,
                        width: 30,
                        child: Center(
                            child: Text(
                          '+',
                          style: TextStyle(fontSize: 24),
                        )),
                      ),
                    ),

                       */
            ],
          ),
        ),
        Row(
          children: [
            Text(
              "delete".tr(),
              style: AppFonts.fontRegularMeduim,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        )
      ],
    );
 }
}
