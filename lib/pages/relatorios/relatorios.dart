import 'package:flutter/material.dart';
import 'package:pi_dois/models/product_model.dart';
import 'package:pi_dois/pages/home/componets/menu_widget.dart';
import 'package:pi_dois/services/product_service.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductService productService = ProductService();
  late Future<List<ProductModel>> productList;

  @override
  void initState() {
    super.initState();
    productList = productService.getAllProducts();
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
      body: FutureBuilder<List<ProductModel>>(
        future: productList,
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
                      var product =
                          (snapshot.data as List<ProductModel>)[index];
                      return Container(
                        padding: const EdgeInsets.all(5),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  product.id.toString(),
                                  style: const TextStyle(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 60),
                                child: Text(
                                  product.descricao,
                                  style: const TextStyle(),
                                ),
                              ),
                              Text(
                                product.tamanho,
                                style: const TextStyle(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: (snapshot.data as List<ProductModel>).length,
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
                            Navigator.of(context).pushNamed('/new-product');
                          },
                          child: const Text(
                            "Novo Produto",
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
