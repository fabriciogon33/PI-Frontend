// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:pi_dois/models/product_model.dart';
// import 'package:pi_dois/services/api.dart';

// class RelatorioService {
//   static String pathUrl = "Relatorio";
//   static String url = Api().urlBase();

//   /*  Future<List<RelatorioModel>> getAllRelatorios() async {
//     try {
//       Response response = await Dio().get(url + pathUrl);
//       if (response.statusCode == 200) {
//         var getRelatoriosData = response.data["results"] as List;
//         var products =
//             getRelatorioData.map((e) => RelatorioModel.fromJson(e)).toList();
//         return relatorios;
//       } else {
//         throw Exception('Falha ao carregar os relatorios');
//       }
//     } catch (e) {
//       throw Exception('Falha ao carregar os relatorios $e');
//     }
//   }

//   Future<RelatorioModel> getRelatorioById(String id) async {
//     try {
//       Response response = await Dio().get(url + pathUrl + id);
//       if (response.statusCode == 200) {
//         return RelatorioModel.fromJson(response.data);
//       } else {
//         throw Exception("Falha ao carregar os relatorios");
//       }
//     } catch (e) {
//       print(e);
//       throw Exception("Relatorio não encontrado $e");
//     }
//   }

//   Future<RelatorioModel?> createRelatorio({required RelatorioModel relatorio}) async {
//     RelatorioModel? relatorioCreate;
//     try {
//       Response response = await Dio().post(
//         url + pathUrl,
//         data: relatorio.toJson(),
//       );
//       print('Relatorio criado: ${response.data}');
//       relatorioCreate = RelatorioModel.fromJson(response.data);
//     } catch (e) {
//       print('Erro ao criar o relatorio: $e');
//       throw Exception("Erro ao cadastrar o relatorio $e");
//     }

//     return productCreate;
//   }

//   Future<ProductModel?> updateProduct(
//       {required ProductModel product, required String id}) async {
//     ProductModel? productCreate;
//     try {
//       Response response = await Dio().put(
//         url + pathUrl + id,
//         data: product.toJson(),
//       );
//       print('Produto criado: ${response.data}');
//       productCreate = ProductModel.fromJson(response.data);
//     } catch (e) {
//       print('Erro ao editar o produto: $e');
//       throw Exception("Erro ao editar o produto $e");
//     }

//     return productCreate;
//   }

//   Future<void> deleteProduct(String id) async {
//     try {
//       await Dio().delete(url + pathUrl + '/' + id);
//     } catch (e) {
//       throw Exception("Erro ao deletar o produto $e");
//     }
//   } */
// }
