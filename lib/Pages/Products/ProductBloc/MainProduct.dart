
import 'package:flutter/material.dart';
import 'package:realstic/Common/Poduct.dart';
import 'package:realstic/Common/Restaurant.dart';

import '../../../Utils/CommonConstants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Home/widgets/Cards/OfferCard.dart';
import '../../Home/widgets/Cards/ProductCard.dart';
import '../../Home/widgets/Cards/ProductCardMini.dart';
import '../../Home/widgets/buildLoading.dart';
import '../bloc/ProductBloc.dart';
import '../bloc/ProductState.dart';



class MainProduct extends StatelessWidget {
  final ProductBloc newsBloc;
  final int isHome;
  MainProduct({Key? key, required this.newsBloc, required this.isHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  BlocProvider(
      lazy: false,
      create: (_) => newsBloc,
      child: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<ProductBloc, ProductState>(
          bloc: newsBloc,
          builder: (context, state) {
            if (state is ProductInitial) {
              return Container();
            } else if (state is ProductLoading) {
              return buildLoading();
            } else if (state is ProductLoaded ) {
              return buildBody(context, state.Model);
            }
            else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, List<Product> model) {
    return  Padding(
      padding: const EdgeInsets.all(1.0),
      child:
      (isHome==1)?
      HomeContent(model) :
      (isHome==2)?
      buildProducts(model):
      buildProductLarge(model)
      ,
    );
  }
  Widget HomeContent(List<Product> model)
  {
    return  Padding(
      padding: const EdgeInsets.all(1.0),
      child: SizedBox(
        height: 150, // Height of the horizontal ListView
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          scrollDirection: Axis.horizontal, // Horizontal scrolling
          itemCount: model.length, // Number of items
          itemBuilder: (context, index) {
            return Container(
              //width: 200, // Width of each item
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: OfferCard(product: model[index],)),

            );
          },
        ),
      ),
    );
  }
  Widget buildProducts(List<Product> model) {
   return  GridView.builder(
     shrinkWrap: true,
     physics: NeverScrollableScrollPhysics(),
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: CommonConstants.itemCount, // Number of columns
         crossAxisSpacing: CommonConstants.itemSpacing,
         mainAxisSpacing: CommonConstants.itemSpacing,
         mainAxisExtent: CommonConstants.itemExtend
     ),
     itemCount: model.length,
     itemBuilder: (context, index) {
       return ProductCardMini(product: model[index],);
     },
   );
  }
  Widget buildProductLarge(List<Product> model) {
    return   ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(0),
      scrollDirection: Axis.vertical, // Horizontal scrolling
      itemCount: model.length, // Number of items
      itemBuilder: (context, index) {
        return Container(
          //width: 200, // Width of each item
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Container(
            // height: 200,
            // width: MediaQuery.of(context).size.width*0.8,
              child: ProductCard(product: model[index],)),

        );
      },
    );
  }


}
