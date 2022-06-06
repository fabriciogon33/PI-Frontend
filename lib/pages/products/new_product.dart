import 'package:flutter/material.dart';
import 'package:pi_dois/models/product_model.dart';
import 'package:pi_dois/pages/products/products.dart';
import 'package:pi_dois/pages/home/componets/custom_text_field.dart';
import 'package:pi_dois/services/product_service.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  ProductService productService = ProductService();
  bool isCreating = false;

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo-preto-amour-certo.png',
          fit: BoxFit.contain,
          height: 72,
        ),
      ),
      body: Column(
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
                        hintText: 'Ex: Azul',
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
                      label: "Observações Gerais",
                      decoration: InputDecoration(
                        hintText: 'Ex: Conteudo',
                      ),
                    ),
                  ),
                  Positioned(
                    top: 390,
                    left: 280,
                    right: 280,
                    bottom: 25,
                    child: isCreating
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
                                isCreating = true;
                              });

                              if (_descricaoController.text != '' &&
                                  _tamanhoController.text != '' &&
                                  _corController.text != '' &&
                                  _valorCustoController.text != '' &&
                                  _valorVendaController.text != '' &&
                                  _observacaoController.text != '') {
                                ProductModel productModel = ProductModel(
                                    id: null,
                                    descricao: _descricaoController.text,
                                    tamanho: _tamanhoController.text,
                                    cor: _corController.text,
                                    valorCusto:
                                        int.parse(_valorCustoController.text),
                                    valorVenda:
                                        int.parse(_valorVendaController.text),
                                    obs: _observacaoController.text);

                                ProductModel? productCreate =
                                    await productService.createProduct(
                                        product: productModel);

                                if (productCreate != null) {
                                  print(productCreate);
                                }
                              }
                              setState(() {
                                isCreating = false;
                                Navigator.pushNamed(context, '/products');
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
      ),
    );
  }
}
