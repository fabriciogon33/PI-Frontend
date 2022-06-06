import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pi_dois/models/pedido_model.dart';
import 'package:pi_dois/services/api.dart';

class PedidoService {
  static String pathUrl = "Pedido";
  static String url = Api().urlBase();

  Future<List<PedidoModel>> getAllPedidos() async {
    try {
      Response response = await Dio().get(url + pathUrl);
      if (response.statusCode == 200) {
        var getPedidoData = response.data["results"] as List;
        var pedidos =
            getPedidoData.map((e) => PedidoModel.fromJson(e)).toList();
        return pedidos;
      } else {
        throw Exception("Falha ao carregar os pedidos");
      }
    } catch (e) {
      throw Exception("Falha ao carregar os pedidos $e");
    }
  }

  Future<PedidoModel> getPedidoById(String id) async {
    try {
      Response response = await Dio().get(url + pathUrl + id);
      if (response.statusCode == 200) {
        return PedidoModel.fromJson(response.data);
      } else {
        throw Exception("Falha ao carregar os pedidos");
      }
    } catch (e) {
      print(e);
      throw Exception("Pedido não encontrado $e");
    }
  }
}
