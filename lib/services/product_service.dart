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

  Future<ProductModel?> createProduct({required ProductModel product}) async {
    ProductModel? productCreate;
    try {
      Response response = await Dio().post(
        url + pathUrl,
        data: product.toJson(),
      );
      print('Produto criado: ${response.data}');
      productCreate = ProductModel.fromJson(response.data);
    } catch (e) {
      print('Erro ao criar o produto: $e');
      throw Exception("Erro ao cadastrar o produto $e");
    }

    return productCreate;
  }

  Future<ProductModel?> updateProduct(
      {required ProductModel product, required String id}) async {
    ProductModel? productCreate;
    try {
      Response response = await Dio().put(
        url + pathUrl + id,
        data: product.toJson(),
      );
      print('Produto criado: ${response.data}');
      productCreate = ProductModel.fromJson(response.data);
    } catch (e) {
      print('Erro ao editar o produto: $e');
      throw Exception("Erro ao editar o produto $e");
    }

    return productCreate;
  }

  Future<void> deleteProduct(String id) async {
    try {
      await Dio().delete(url + pathUrl + '/' + id);
    } catch (e) {
      throw Exception("Erro ao deletar o produto $e");
    }
  }
}
