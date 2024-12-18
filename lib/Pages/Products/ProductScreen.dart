import 'package:flutter/material.dart';
import 'package:realstic/Pages/Products/ProductBloc/MainProduct.dart';
import 'package:realstic/Pages/Products/bloc/ProductEvent.dart';
import 'package:realstic/Utils/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Utils/AppFonts.dart';
import '../../Utils/CommonConstants.dart';
import '../../Utils/style.dart';
import '../../Widget/CommonWidget.dart';
import '../Drawer/CustomBottomNavigation.dart';
import '../Home/widgets/Cards/ProductCard.dart';
import '../Home/widgets/Cards/ProductCardMini.dart';
import '../Home/widgets/Search.dart';
import 'bloc/ProductBloc.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() {
    return _ProductScreenState();
  }
}

class _ProductScreenState extends State<ProductScreen> {


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

          bottomNavigationBar: new CustomBottomNavigation(1),
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
        buildHeader("popular_products".tr()),
        buildProducts(),
        CommonWidget.rowHeight(height: 20),
        buildHeader("products".tr()),
        buildProductsLarge(),
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
          SizedBox(width: 10,),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.share, color:greyColor), // Icon inside the button
                onPressed: () {
                  // Navigator.of(context).pop();
                },
              ),
              IconButton(
                icon: Icon(Icons.info, color:greyColor), // Icon inside the button
                onPressed: () {
                  // Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget buildHeader(String title)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:Text(title,style: AppFonts.fontBoldMeduim.copyWith(color: textColor),),
    );
  }
  final ProductBloc _newsBloc = ProductBloc();

  @override
  void initState() {
    super.initState();
    startInit();
  }
  startInit()async
  {
    _newsBloc.add(GetProductInitial());
  }
  Widget buildProducts() {
    return MainProduct(newsBloc: _newsBloc, isHome: 2,);
  }
  Widget buildProductsLarge()
  {
    return MainProduct(newsBloc: _newsBloc, isHome: 3,);
  }
}