import 'package:flutter/material.dart';
import 'package:realstic/Common/Restaurant.dart';

import '../../../Utils/CommonConstants.dart';
import '../bloc/DashBoardBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/DashBoardState.dart';
import '../widgets/Cards/ResturantCard.dart';
import '../widgets/buildLoading.dart';

class MainRest extends StatelessWidget {
  final DashBoardBloc newsBloc;
  final bool isHome;
  MainRest({Key? key, required this.newsBloc, required this.isHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  BlocProvider(
      lazy: false,
      create: (_) => newsBloc,
      child: BlocListener<DashBoardBloc, DashBoardState>(
        listener: (context, state) {
          if (state is CovidError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<DashBoardBloc, DashBoardState>(
          bloc: newsBloc,
          builder: (context, state) {
            if (state is DashBoardInitial) {
              return Container();
            } else if (state is CovidLoading) {
              return buildLoading();
            } else if (state is DashBoardLoaded ) {
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

  Widget buildBody(BuildContext context, List<Restaurant> model) {
    return  Padding(
      padding: const EdgeInsets.all(1.0),
      child:
      (isHome)?
      SizedBox(
        height: 270, // Height of the horizontal ListView
        child: HomeContent(model)
      ):
      buildProducts(model)
      ,
    );
  }
  Widget HomeContent(List<Restaurant> model)
  {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      scrollDirection: Axis.horizontal, // Horizontal scrolling
      itemCount: model.length, // Number of items
      itemBuilder: (context, index) {
        return Container(
          width: 200, // Width of each item
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          child: RestaurantCard(restaurant:model[index],),
        );
      },
    );
  }
  Widget buildProducts(List<Restaurant> model) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: CommonConstants.itemCount, // Number of columns
          crossAxisSpacing: CommonConstants.itemSpacing,
          mainAxisSpacing: CommonConstants.itemSpacing,
          mainAxisExtent: CommonConstants.itemExtend+60
      ),
      itemCount: model.length,
      itemBuilder: (context, index) {
        return RestaurantCard(restaurant: model[index]);
      },
    );
  }

}
