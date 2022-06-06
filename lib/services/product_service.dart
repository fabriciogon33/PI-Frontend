import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pi_dois/models/product_model.dart';
import 'package:pi_dois/services/api.dart';

class ProductService {
  static String pathUrl = "Produto";
  static String url = Api().urlBase();

  Future<List<ProductModel>> getAllProducts() async {
    try {
      Response response = await Dio().get(url + pathUrl);
      if (response.statusCode == 200) {
        var getProductsData = response.data["results"] as List;
        var products =
            getProductsData.map((e) => ProductModel.fromJson(e)).toList();
        return products;
      } else {
        throw Exception('Falha ao carregar os produtos');
      }
    } catch (e) {
      throw Exception('Falha ao carregar os produtos $e');
    }
  }

  Future<ProductModel> getProductById(String id) async {
    try {
      Response response = await Dio().get(url + pathUrl + id);
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data);
      } else {
        throw Exception("Falha ao carregar os produtos");
      }
    } catch (e) {
      print(e);
      throw Exception("Produto não encontrado $e");
    }
  }
}
