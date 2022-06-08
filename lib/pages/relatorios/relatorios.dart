/* import 'package:flutter/material.dart';
import 'package:pi_dois/models/relatorio_model.dart';
import 'package:pi_dois/pages/home/componets/menu_widget.dart';
import 'package:pi_dois/services/relatorio_service.dart';

class RelatorioScreen extends StatefulWidget {
  const RelatorioScreen({Key? key}) : super(key: key);

  @override
  State<RelatorioScreen> createState() => _RelatorioScreenState();
}

/* class _RelatorioScreenState extends State<RelatorioScreen> {
  RelatorioService relatorioService = RelatorioService();
  late Future<List<RelatorioModel>> relatorioList;
 */
  @override
  void initState() {
    super.initState();
   // relatorioList = relatorioService.getAllrelatorios();
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
      body: FutureBuilder<List<RelatorioModel>>(
        future:relatorioList,
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
                          (snapshot.data as List<RelatorioModel>)[index];
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
                                  'Novo Relatório'
                                ),
                              ),
                                              Positioned(
                        top: 10,
                        bottom: 80,
                        left: 420,
                        right: 10,
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
                            "Novo Relatório",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff707070)),
                          ),
                        ),
                      )
                              ),
                              
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: (snapshot.data as List<RelatorioModel>).length,
                  ),
                ),
                
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
 */