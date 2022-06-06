class ProductModel {
  int? id;
  String descricao;
  String tamanho;
  String cor;
  int valorCusto;
  int valorVenda;
  String? obs;

  ProductModel({
    this.id,
    required this.descricao,
    required this.tamanho,
    required this.cor,
    required this.valorCusto,
    required this.valorVenda,
    this.obs,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      descricao: json['descricao'],
      tamanho: json['tamanho'],
      cor: json['cor'],
      valorCusto: json['valor_custo'],
      valorVenda: json['valor_venda'],
      obs: json['obs'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'descricao': descricao,
        'tamanho': tamanho,
        'cor': cor,
        'valor_custo': valorCusto,
        'valor_venda': valorVenda,
        'obs': obs
      };
}
