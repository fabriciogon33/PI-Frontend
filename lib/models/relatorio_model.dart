/* class RelatorioModel {
  /* int? id;
  int clienteId;
  
  String dataEntrega;
  String obs;
  String status;
  int valorTotalBruto;
  int valorFrete;
  int desconto;
  int valorTotalLiquido;
  int transportadoraId;
  int formaPagtoId;
  int statusId; */

  RelatorioModel(
      /*{
    this.id,
    required this.clienteId,
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
  }*/
      );

  factory RelatorioModel.fromJson(Map<String, dynamic> json) {
    return RelatorioModel(
        /* id: json['id'],
      clienteId: json['cliente_id'],
      dataEntrega: json['data_entrega'],
      obs: json['obs'],
      status: json['status'],
      valorTotalBruto: json['valor_total_bruto'],
      valorFrete: json['valor_frete'],
      desconto: json['desconto'],
      valorTotalLiquido: json['valor_total_liquido'],
      transportadoraId: json['transportadora_id'],
      formaPagtoId: json['forma_pgto_id'],
      statusId: json['status_id'], */
        );
  }

  Map<String, dynamic> toJson() => {
        // 'id': id,
        // 'cliente_id': clienteId,
        // 'data_entrega': dataEntrega,
        // 'obs': obs,
        // 'status': status,
        // 'valor_total_bruto': valorTotalBruto,
        // 'valor_frete': valorFrete,
        // 'desconto': desconto,
        // 'valor_total_liquido': valorTotalLiquido,
        // 'transportadora_id': transportadoraId,
        // 'forma_pgto_id': formaPagtoId,
        // 'status_id': statusId
      };
}
 */