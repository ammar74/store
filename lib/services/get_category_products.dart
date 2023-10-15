import 'package:store/constants.dart';
import 'package:store/helper/api.dart';
import 'package:store/models/ProductModel.dart';

class GetCategory{

  Future<List<ProductModel>> getCategoryProducts({required String categoryName}) async{

        List<dynamic> data= await Api().get(url: '$kBaseUrl/products/category/$categoryName');
        List<ProductModel> productsList= [];

        for(int i=0; i< data.length; i++){
          productsList.add(
            ProductModel.fromJson(data[i]),
          );
        }
        return productsList;
      }

}