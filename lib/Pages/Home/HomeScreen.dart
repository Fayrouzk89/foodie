import 'package:flutter/material.dart';
import 'package:realstic/Common/Restaurant.dart';
import 'package:realstic/Helper/LocalDataHelper.dart';
import 'package:realstic/Pages/Home/HomeBloc/MainRest.dart';
import 'package:realstic/Pages/Home/widgets/Cards/CategoryCard.dart';
import 'package:realstic/Pages/Home/widgets/Cards/OfferCard.dart';
import 'package:realstic/Pages/Home/widgets/Cards/ResturantCard.dart';
import 'package:realstic/Pages/Home/widgets/Search.dart';
import 'package:realstic/Pages/Products/bloc/ProductBloc.dart';
import 'package:realstic/Utils/AppFonts.dart';
import 'package:realstic/Utils/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:realstic/Utils/style.dart';

import '../../Common/Category.dart';
import '../../Utils/CommonConstants.dart';
import '../../Utils/SizeConfig.dart';
import '../../Utils/sizes_consts.dart';
import '../../Widget/CommonWidget.dart';
import '../Drawer/CustomBottomNavigation.dart';

import '../Products/ProductBloc/MainProduct.dart';
import '../Products/bloc/ProductEvent.dart';
import 'bloc/DashBoardBloc.dart';
import 'bloc/DashBoardEvent.dart';
import 'bloc/DashBoardState.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller=TextEditingController();
  final DashBoardBloc _newsBloc = DashBoardBloc();
  final ProductBloc _prodBloc=ProductBloc();
  @override
  void initState() {
    super.initState();
    startInit();
  }
  startInit()async
  {
      _newsBloc.add(GetDashBoardInitial());
      _prodBloc.add(GetProductInitial());
  }

  @override
  void dispose() {
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ThemeData theme = context.theme;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Title(
        title: 'app_name'.tr(),
        color: Colors.black,
        child: Scaffold(
          key: _scaffoldKey,
          // drawer: CustomDrawer(currentPage: DrawerSections.import_data,),
          //   appBar: AppBarWithBack( context, 'settings'.tr(), theme),
          body: buildMain(theme),

          bottomNavigationBar: new CustomBottomNavigation(0),
        ),
      ),
    );
  }
  Widget buildMain( ThemeData theme)
  {
    return ListView(
      children: [
        CommonWidget.rowHeight(height: 20),
        buildSearch(),
        CommonWidget.rowHeight(height: 20),
        buildCategory(),
        CommonWidget.rowHeight(height: 20),
        buildHeader("restaurants".tr(),"define_rest".tr()),
        CommonWidget.rowHeight(height: 1),
        buildRest(),
        CommonWidget.rowHeight(height: 20),
        buildHeader("offers".tr(),"define_offers".tr()),
        CommonWidget.rowHeight(height: 1),
        buildOffers(),
        CommonWidget.rowHeight(height: 20),
      ],
    );
  }
  Widget buildSearch()
  {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [

          Expanded(
            child: Container(
               height: CommonConstants.searchHeight,
              child: SearchTextField(controller: controller,)
            ),
          ),
          const SizedBox(width: 10,),
          Container(
            height: CommonConstants.searchHeight,
            width: CommonConstants.searchHeight,
            decoration: BoxDecoration(
              color: Colors.grey[200], // Background color of the button
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),  // Makes the container round
            ),
            child: IconButton(
              icon: const Icon(Icons.filter_alt, color: Colors.white), // Icon inside the button
              onPressed: () {
               // Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget buildCategory()
  {
    List<Category>categories=LocalDataHelper.getCategories();
    return   GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // number of items per row
        crossAxisCount: 4,
        // vertical spacing between the items
        mainAxisSpacing: 6,
        // horizontal spacing between the items
        crossAxisSpacing: 3,
        mainAxisExtent:
        SizeConfig().screenWidth * CommonConstants.categoryWidth +
            28,
      ),
      // number of items in your list
      itemCount: categories.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return CategoryCard(categories[index]);
      },
    );
  }
  Widget buildHeader(String title,String subTitle)
  {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: AppFonts.fontBoldMeduim.copyWith(color: primaryColor),),
              Text(subTitle,style:AppFonts.fontRegularSmall.copyWith(color: Colors.black12 ))
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200], // Background color of the button
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),  // Makes the container round
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_circle_left_outlined, color: primaryColor), // Icon inside the button
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
   );
  }
  Widget buildRest()
  {
     return MainRest(newsBloc: _newsBloc, isHome: true,);
  }

  Widget buildOffers()
  {
    return MainProduct(newsBloc: _prodBloc, isHome: 1,);
    /*
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: SizedBox(
        height: 150, // Height of the horizontal ListView
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          scrollDirection: Axis.horizontal, // Horizontal scrolling
          itemCount: 10, // Number of items
          itemBuilder: (context, index) {
            return Container(
              //width: 200, // Width of each item
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: OfferCard()),

            );
          },
        ),
      ),
    );

     */
  }

}