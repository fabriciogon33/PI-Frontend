import 'package:flutter/material.dart';
import 'package:pi_dois/models/product_model.dart';
import 'package:pi_dois/pages/home/componets/custom_text_field.dart';
import 'package:pi_dois/routes/product_routes_arguments.dart';
import 'package:pi_dois/services/product_service.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductService productService = ProductService();
  late Future<ProductModel> product;

  final _descricaoController = TextEditingController();
  final _tamanhoController = TextEditingController();
  final _corController = TextEditingController();
  final _valorCustoController = TextEditingController();
  final _valorVendaController = TextEditingController();
  final _observacaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductArgumens;
    product = productService.getProductById('/' + args.id);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo-preto-amour-certo.png',
          fit: BoxFit.contain,
          height: 72,
        ),
      ),
      body: FutureBuilder<ProductModel>(
        future: product,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var product = snapshot.data;
            _descricaoController.text = product!.descricao.toString();
            _tamanhoController.text = product.tamanho.toString();
            _corController.text = product.cor.toString();
            _valorCustoController.text = product.valorCusto.toString();
            _valorVendaController.text = product.valorVenda.toString();
            _observacaoController.text = product.obs.toString();
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
                            controller: _descricaoController,
                            label: "Descrição",
                            decoration: InputDecoration(
                              hintText: 'Ex: Vestido',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          bottom: 80,
                          left: 420,
                          right: 10,
                          child: CustomTextField(
                            controller: _tamanhoController,
                            label: "Tamanho",
                            decoration: InputDecoration(
                              hintText: 'Ex: M',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          bottom: 80,
                          left: 10,
                          right: 480,
                          child: CustomTextField(
                            controller: _corController,
                            label: "Cor",
                            decoration: InputDecoration(
                              hintText: 'Ex: Verde',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          bottom: 80,
                          left: 320,
                          right: 10,
                          child: CustomTextField(
                            controller: _valorCustoController,
                            label: "Valor de Custo",
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
                            controller: _valorVendaController,
                            label: "Valor de Venda",
                            decoration: InputDecoration(
                              hintText: 'Ex: 100,00',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          bottom: 80,
                          left: 280,
                          right: 10,
                          child: CustomTextField(
                            controller: _observacaoController,
                            label: "Observação",
                            decoration: InputDecoration(
                              hintText: 'Ex: Embrulhar para presente',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 390,
                          left: 280,
                          right: 280,
                          bottom: 25,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.square(55),
                              primary: const Color(0xffECDBC9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/costumers');
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
