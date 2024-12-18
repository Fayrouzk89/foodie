import 'package:flutter/material.dart';

import 'Cards/BillCard.dart';
import 'Cards/CartCard.dart';

class LastCart extends StatefulWidget {
  LastCart({Key? key}) : super(key: key);

  @override
  _LastCartState createState() {
    return _LastCartState();
  }
}

class _LastCartState extends State<LastCart> {
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
              return CartCard(isCart: false,);
            },
          ),
        ),
        SizedBox(height: 10,),
      ],
    );
  }

}