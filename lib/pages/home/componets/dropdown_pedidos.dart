import 'package:flutter/material.dart';

class DropDownCliente extends StatelessWidget {
  final dropValueCliente = ValueNotifier('');
  final dropOpcoesCliente = ['Luana', 'Paula', 'Juliana'];

  DropDownCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: ValueListenableBuilder(
          valueListenable: dropValueCliente,
          builder: (BuildContext context, String value, _) {
            return DropdownButton<String>(
              hint: const Text('Escolha o Cliente'),
              value: (value.isEmpty) ? null : value,
              onChanged: (escolha) =>
                  dropValueCliente.value = escolha.toString(),
              items: dropOpcoesCliente
                  .map((op) => DropdownMenuItem(
                        value: op,
                        child: Text(op),
                      ))
                  .toList(),
            );
          }),
    );
  }
}
