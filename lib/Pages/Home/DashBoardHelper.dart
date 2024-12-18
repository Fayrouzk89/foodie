import 'package:realstic/Common/Poduct.dart';

import '../../Common/Restaurant.dart';
import '../../Helper/SharedHelper.dart';
import '../../UseCase/HomeUseCase.dart';

class DashBoardHelper
{
  static List<Restaurant>?restList;
  static List<Product>?productList;
  static  Future<List<Restaurant>>getDashBoardRest()async
  {
    if(restList!=null)
      {
        return restList!;
      }
    else
      {
    List<Restaurant>rest=[];
    await SharedHelper.initHomeUseCase();
    rest = await SharedHelper.dIinstance<HomeUseCase>().executeGetRest();
    restList=rest;
    return rest;
      }
  }
  static  Future<List<Product>>getDashBoardProduct()async
  {
    if(productList!=null)
    {
      return productList!;
    }
    else
    {
      List<Product>rest=[];
      await SharedHelper.initHomeUseCase();
      rest = await SharedHelper.dIinstance<HomeUseCase>().executeGetProducts();
      productList=rest;
      return rest;
    }
  }

}