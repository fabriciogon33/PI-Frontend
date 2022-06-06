import 'package:flutter/material.dart';
import 'package:pi_dois/models/pedido_model.dart';
import 'package:pi_dois/pages/home/componets/custom_text_field.dart';
import 'package:pi_dois/routes/pedido_routes_arguments.dart';
import 'package:pi_dois/services/pedido_service.dart';

class PedidoDetailScreen extends StatefulWidget {
  const PedidoDetailScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<PedidoDetailScreen> createState() => _PedidoDetailScreenState();
}

class _PedidoDetailScreenState extends State<PedidoDetailScreen> {
  PedidoService pedidoService = PedidoService();
  late Future<PedidoModel> pedido;
  bool isUpdating = false;

  final _clienteIdController = TextEditingController();
  final _dataEntregaController = TextEditingController();
  final _obsController = TextEditingController();
  final _statusController = TextEditingController();
  final _valorTotalBrutoController = TextEditingController();
  final _valorFreteController = TextEditingController();
  final _descontoController = TextEditingController();
  final _valorTotalLiquidoController = TextEditingController();
  final _transportadoraIdController = TextEditingController();
  final _formaPagtoIdController = TextEditingController();
  final _statusIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PedidoArgumens;
    pedido = pedidoService.getPedidoById('/' + args.id);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo-preto-amour-certo.png',
          fit: BoxFit.contain,
          height: 72,
        ),
      ),
      body: FutureBuilder<PedidoModel>(
        future: pedido,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var pedido = snapshot.data;
            _clienteIdController.text = pedido!.clienteId.toString();
            _dataEntregaController.text = pedido.dataEntrega.toString();
            _obsController.text = pedido.obs.toString();
            _statusController.text = pedido.status.toString();
            _valorTotalBrutoController.text = pedido.valorTotalBruto.toString();
            _valorFreteController.text = pedido.valorFrete.toString();
            _descontoController.text = pedido.desconto.toString();
            _valorTotalLiquidoController.text =
                pedido.valorTotalLiquido.toString();
            _transportadoraIdController.text =
                pedido.transportadoraId.toString();
            _formaPagtoIdController.text = pedido.formaPagtoId.toString();
            _statusIdController.text = pedido.statusId.toString();

            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(350, 60, 0, 0),
                  height: 500,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          bottom: 80,
                          left: 10,
                          right: 380,
                          child: CustomTextField(
                            controller: _clienteIdController,
                            label: "Cliente ID",
                            decoration: InputDecoration(
                              hintText: 'Ex: Id',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          bottom: 80,
                          left: 10,
                          right: 380,
                          child: CustomTextField(
                            controller: _dataEntregaController,
                            label: "Data de Entrega",
                            decoration: InputDecoration(
                              hintText: 'Ex: 12/05/2022',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          bottom: 80,
                          left: 420,
                          right: 10,
                          child: CustomTextField(
                            controller: _obsController,
                            label: "Observação",
                            decoration: InputDecoration(
                              hintText: 'Ex: ligar antes',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          bottom: 80,
                          left: 10,
                          right: 480,
                          child: CustomTextField(
                            controller: _statusController,
                            label: "Status",
                            decoration: InputDecoration(
                              hintText: 'Ex: Entregue',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          bottom: 80,
                          left: 320,
                          right: 10,
                          child: CustomTextField(
                            controller: _valorTotalBrutoController,
                            label: "Valor Total Bruto",
                            decoration: InputDecoration(
                              hintText: 'Ex: 50,00',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          bottom: 80,
                          left: 10,
                          right: 520,
                          child: CustomTextField(
                            controller: _valorFreteController,
                            label: "Valor do Frete",
                            decoration: InputDecoration(
                              hintText: 'Ex: 10,00',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          bottom: 80,
                          left: 280,
                          right: 10,
                          child: CustomTextField(
                            controller: _descontoController,
                            label: "Desconto",
                            decoration: InputDecoration(
                              hintText: 'Ex: 10,00',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          bottom: 80,
                          left: 280,
                          right: 10,
                          child: CustomTextField(
                            controller: _valorTotalLiquidoController,
                            label: "Valor Total Liquido",
                            decoration: InputDecoration(
                              hintText: 'Ex: 75,00',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          bottom: 80,
                          left: 280,
                          right: 10,
                          child: CustomTextField(
                            controller: _transportadoraIdController,
                            label: "Transportadora Id",
                            decoration: InputDecoration(
                              hintText: 'Ex: Correios',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          bottom: 80,
                          left: 280,
                          right: 10,
                          child: CustomTextField(
                            controller: _formaPagtoIdController,
                            label: "Forma de Pagamento",
                            decoration: InputDecoration(
                              hintText: 'Ex: cartão',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          bottom: 80,
                          left: 280,
                          right: 10,
                          child: CustomTextField(
                            controller: _statusIdController,
                            label: "Status Id",
                            decoration: InputDecoration(
                              hintText: 'Ex: entregue',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 390,
                          left: 280,
                          right: 280,
                          bottom: 25,
                          child: isUpdating
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.square(55),
                                    primary: const Color(0xffECDBC9),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      isUpdating = true;
                                    });

                                    if (_clienteIdController.text != '' &&
                                  _dataEntregaController.text != '' &&
                                  _obsController.text != '' &&
                                  _statusController.text != '' &&
                                  _valorTotalBrutoController.text != '' &&
                                  _valorFreteController.text != '' &&
                                  _descontoController.text != '' &&
                                  _valorTotalLiquidoController.text != '' &&
                                  _transportadoraIdController.text != '' &&
                                  _formaPagtoIdController.text != '' &&
                                PedidoModel pedidoModel = PedidoModel(
                                    clienteId: null,
                                    dataEntrega: _dataEntregaController.text,
                                    obs: _obsController.text,
                                    status: _statusController.text,
                                    valorTotalBruto: _valorTotalBrutoController.text,
                                    valorFrete: _valorFreteController.text,
                                    desconto: _descontoController.text,
                                    valorTotalLiquido: _valorTotalLiquidoController.text,
                                    transportadoraId: _transportadoraIdController.text,
                                    formaPagtoId: _formaPagtoIdController.text
                                    );
                                  PedidoModel? pedidoCreate =
                                          await pedidoService.updatePedido(
                                              pedido: pedidoModel,
                                              clienteId: '/' + args.id);

                                      if (pedidoCreate != null) {
                                        print(pedidoCreate);
                                      }
                                    }
                                    setState(() {
                                      isUpdating = false;
                                      Navigator.pushNamed(
                                          context, '/pedidos');
                                    });
                                  },

                            child: const Text(
                              "Salvar",
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xff707070)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.indigo,
            ),
          );
        },
      ),
    );
  }
}
