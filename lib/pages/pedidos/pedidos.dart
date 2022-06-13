import 'package:flutter/material.dart';
import 'package:pi_dois/models/pedido_model.dart';
import 'package:pi_dois/pages/pedidos/pedido_detail.dart';
import 'package:pi_dois/pages/home/componets/menu_widget.dart';
import 'package:pi_dois/routes/pedido_routes_arguments.dart';
import 'package:pi_dois/services/pedido_service.dart';

class PedidoScreen extends StatefulWidget {
  const PedidoScreen({Key? key}) : super(key: key);

  @override
  State<PedidoScreen> createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> {
  PedidoService pedidoService = PedidoService();
  late Future<List<PedidoModel>> pedidoList;
  bool isDeleting = false;

  @override
  void initState() {
    super.initState();
    pedidoList = pedidoService.getAllPedidos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo-preto-amour-certo.png',
          fit: BoxFit.contain,
          height: 72,
        ),
      ),
      drawer: const MenuWidget(),
      body: FutureBuilder<List<PedidoModel>>(
        future: pedidoList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(250, 60, 140, 0),
                  height: 350,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      var pedido = (snapshot.data as List<PedidoModel>)[index];
                      return Container(
                        padding: const EdgeInsets.all(5),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/pedidos-detail',
                                arguments: PedidoArgumens(pedido.id.toString()),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    pedido.id.toString(),
                                    style: const TextStyle(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Text(
                                    pedido.dataPedido,
                                    style: const TextStyle(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Text(
                                    pedido.clienteId.toString(),
                                    style: const TextStyle(),
                                  ),
                                ),
                                Text(
                                  pedido.dataEntrega,
                                  style: const TextStyle(),
                                ),
                                new Spacer(),
                                isDeleting
                                    ? CircularProgressIndicator()
                                    : IconButton(
                                        onPressed: () async {
                                          setState(() {
                                            isDeleting = true;
                                          });
                                          pedidoService.deletePedido(
                                              pedido.id.toString());
                                          setState(() {
                                            isDeleting = false;
                                            pedidoList =
                                                pedidoService.getAllPedidos();
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        super.widget));
                                          });
                                        },
                                        iconSize: 25,
                                        icon: const Icon(Icons.delete))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: (snapshot.data as List<PedidoModel>).length,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 75,
                        bottom: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.square(55),
                            primary: const Color(0xffECDBC9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/new-pedido');
                          },
                          child: const Text(
                            "Novo Pedido",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff707070)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
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
