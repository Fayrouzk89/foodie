import 'package:flutter/material.dart';
import 'package:realstic/Utils/AppFonts.dart';

import '../../../../Common/Poduct.dart';
import '../../../../Utils/style.dart';
import '../../../../Widget/CommonWidget.dart';

class OfferCard extends StatefulWidget {
  final Product product;
  OfferCard({Key? key, required this.product}) : super(key: key);

  @override
  _OfferCardState createState() {
    return _OfferCardState();
  }
}

class _OfferCardState extends State<OfferCard> {
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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200], // Background color of the button
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),  // Makes the container round
          ),
          child: Row(
            children: [
              // 2/3 Section
              Expanded(
                flex: 3, // Takes 2/3 of the width
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          'فئة المنتج',
                          style: AppFonts.fontRegularSmall,
                        ),
                        CommonWidget.rowHeight(height: 5),
                        Text(
                          widget.product.name!,
                          style:  AppFonts.fontBoldSmall,
                        ),
                        CommonWidget.rowHeight(height: 5),
                        Row(
                          children: [
                            Text("مكان ",style: AppFonts.fontRegularSmall,),
                            const SizedBox(width: 2,),
                            Icon(Icons.account_balance,color: primaryColor,size: 20,),
                          ],
                        ),
                        CommonWidget.rowHeight(height: 5),
                        buildPrice()
                      ],
                    ),
                  ),
                ),
              ),
              // 1/3 Section
              Expanded(
                flex: 2, // Takes 1/3 of the width
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      //color: Colors.grey,
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Text(
                          "50% حسم",
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
            ],
          ),
        ),
      ),
    );
  }

 Widget buildPrice() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color (optional)
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
          border: Border.all(
            color: Colors.grey, // Border color
            width: 1.0, // Border width
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.product.price!),
              Icon(Icons.add_circle,color: primaryColor,)
            ],
          ),
        ));
 }
}