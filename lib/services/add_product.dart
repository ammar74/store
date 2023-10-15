import 'package:store/constants.dart';
import 'package:store/helper/api.dart';
import 'package:store/models/ProductModel.dart';

class AddProduct{

  Future<ProductModel> addProduct({required String title,
    required double price,
    required String desc,
    required String category,
    required String image}) async{

    Map<String, dynamic> data = await Api().post(
        url: '$kBaseUrl/products',
        body: {
          'title': title,
          'price':price,
          'description': desc,
          'image': image,
          'category':category}
        );
    return ProductModel.fromJson(data);
  }
}