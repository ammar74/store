import 'package:store/helper/api.dart';
import 'package:store/models/ProductModel.dart';

class UpdateProductService{
  Future<ProductModel> updateProduct({
    required int id,
    required String title,
    required dynamic price,
    required String desc,
    required String category,
    required String image}) async{

    Map<String, dynamic> data = await Api().put(
        url: 'https://fakestoreapi.com/products/$id',
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