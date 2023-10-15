import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store/constants.dart';
import 'package:store/helper/api.dart';

class GetAllCategories{

  Future<List<dynamic>> getAllCategories() async {

      List<dynamic> data = await Api().get(url: '$kBaseUrl/products/categories');
      return data;

  }
}