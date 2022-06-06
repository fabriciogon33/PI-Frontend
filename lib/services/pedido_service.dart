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

  Future<PedidoModel?> createPedido({required PedidoModel pedido}) async {
    PedidoModel? pedidoCreate;
    try {
      Response response = await Dio().post(
        url + pathUrl,
        data: pedido.toJson(),
      );
      print('Pedido criado: ${response.data}');
      pedidoCreate = PedidoModel.fromJson(response.data);
    } catch (e) {
      print('Erro ao criar pedido: $e');
      throw Exception("Erro ao cadastrar pedido $e");
    }

    return pedidoCreate;
  }

  Future<PedidoModel?> updatePedido(
      {required PedidoModel pedido, required String id}) async {
    PedidoModel? pedidoCreate;
    try {
      Response response = await Dio().put(
        url + pathUrl + id,
        data: pedido.toJson(),
      );
      print('Usuário criado: ${response.data}');
      pedidoCreate = PedidoModel.fromJson(response.data);
    } catch (e) {
      print('Erro ao editar o pedido: $e');
      throw Exception("Erro ao editar pedido $e");
    }

    return pedidoCreate;
  }

  Future<void> deletePedido(String id) async {
    try {
      await Dio().delete(url + pathUrl + '/' + id);
    } catch (e) {
      throw Exception("Erro ao deletar pedido $e");
    }
  }
}
