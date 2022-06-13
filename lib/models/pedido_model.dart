class PedidoModel {
  int? id;
  int clienteId;
  String dataPedido;
  String dataEntrega;
  String obs;
  String status;
  double valorTotalBruto;
  double valorFrete;
  double desconto;
  double valorTotalLiquido;
  int transportadoraId;
  int formaPagtoId;
  int statusId;

  PedidoModel({
    this.id,
    required this.clienteId,
    required this.dataPedido,
    required this.dataEntrega,
    required this.obs,
    required this.status,
    required this.valorTotalBruto,
    required this.valorFrete,
    required this.desconto,
    required this.valorTotalLiquido,
    required this.transportadoraId,
    required this.formaPagtoId,
    required this.statusId,
  });

  factory PedidoModel.fromJson(Map<String, dynamic> json) {
    return PedidoModel(
      id: json['id'],
      clienteId: json['cliente_id'],
      dataPedido: json['data_pedido'],
      dataEntrega: json['data_entrega'],
      obs: json['obs'],
      status: json['status'],
      valorTotalBruto: json['valor_total_bruto'],
      valorFrete: json['valor_frete'],
      desconto: json['desconto'],
      valorTotalLiquido: json['valor_total_liquido'],
      transportadoraId: json['transportadora_id'],
      formaPagtoId: json['forma_pagto_id'],
      statusId: json['status_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'cliente_id': clienteId,
        'data_pedido': dataPedido,
        'data_entrega': dataEntrega,
        'obs': obs,
        'status': status,
        'valor_total_bruto': valorTotalBruto,
        'valor_frete': valorFrete,
        'desconto': desconto,
        'valor_total_liquido': valorTotalLiquido,
        'transportadora_id': transportadoraId,
        'forma_pagto_id': formaPagtoId,
        'status_id': statusId
      };
}
