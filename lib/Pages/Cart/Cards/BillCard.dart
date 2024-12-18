import 'package:flutter/material.dart';

import '../../../Utils/style.dart';
import 'package:easy_localization/easy_localization.dart';

class BillCard extends StatefulWidget {
  BillCard({Key? key}) : super(key: key);

  @override
  _CartCardState createState() {
    return _CartCardState();
  }
}

class _CartCardState extends State<BillCard> {


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  int qty=1;
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
            // crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 82,
                width: 82,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: greyColor),
                child: Container(
                  child: Image.asset("assets/images/product.png",fit: BoxFit.fill,),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("اسم المنتج"),
                  Text("فئة المنتج"),
                  Text("45.123 ريال")
                ],
              ),

            ],
          ),

        ],
      ),
    );
  }


  void function1() {
    qty=qty+1;
    setState(() {

    });
  }
  void function2()
  {
    qty=qty-1;
    setState(() {

    });
  }
}