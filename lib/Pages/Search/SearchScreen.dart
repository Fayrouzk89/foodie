import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:realstic/Common/Restaurant.dart';
import 'package:realstic/Pages/Home/widgets/Cards/ResturantCard.dart';
import 'package:realstic/Utils/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Utils/CommonConstants.dart';
import '../../Utils/style.dart';
import '../../Widget/CommonWidget.dart';
import '../Drawer/CustomBottomNavigation.dart';
import '../Home/HomeBloc/MainRest.dart';
import '../Home/bloc/DashBoardBloc.dart';
import '../Home/bloc/DashBoardEvent.dart';
import '../Home/widgets/Cards/ProductCard.dart';
import '../Home/widgets/Cards/ProductCardMini.dart';
import '../Home/widgets/Search.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() {
    return _ProductScreenState();
  }
}

class _ProductScreenState extends State<SearchScreen> {

  @override
  void dispose() {
    super.dispose();
  }
  TextEditingController controller=TextEditingController();

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

          bottomNavigationBar: new CustomBottomNavigation(2),
        ),
      ),
    );
  }
  Widget buildMain( ThemeData theme)
  {
    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      children: [
        CommonWidget.rowHeight(height: 20),
        buildSearch(),
        CommonWidget.rowHeight(height: 20),
        buildProducts(),
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
          IconButton(
            icon: Icon(Icons.arrow_back, color:greyColor), // Icon inside the button
            onPressed: () {
              // Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Container(
              height:  CommonConstants.searchHeight,
                child: SearchTextField(controller: controller,)
            ),
          ),

        ],
      ),
    );
  }
  Widget buildHeader(String title)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:Text(title,style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: CommonConstants.meduimText),),
    );
  }
  final DashBoardBloc _newsBloc = DashBoardBloc();

  @override
  void initState() {
    super.initState();
    startInit();
  }
  startInit()async
  {
    _newsBloc.add(GetDashBoardInitial());
  }
  Widget buildProducts() {
    return MainRest(newsBloc: _newsBloc, isHome: false,);
  }
  
}