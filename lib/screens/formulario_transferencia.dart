import 'package:flutter/material.dart';
import '../components/editor.dart';
import '../models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({super.key});

  @override
  State<FormularioTransferencia> createState() =>
      _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  //Controlar funções relacionadas a texto.
  final TextEditingController _controladorNumeroValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criando Transferências"),
      ),
      body: SingleChildScrollView(
          //Corrige bugs ao usar o celular deitado.
          child: Column(
        children: [
          Editor(
              //Cria um text field formatado.
              controller: _controladorNumeroConta,
              rotulo: "Número da Conta",
              dica: "1234"),
          Editor(
              // ||
              controller: _controladorNumeroValor,
              rotulo: "Valor",
              dica: "12,34",
              icon: Icons.monetization_on),
          ElevatedButton(
              child: const Text("Confirmar"),
              onPressed: () {
                criaTransferencia(context);
              })
        ],
      )),
    );
  }

  void criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorNumeroConta.text);
    final double? valor = double.tryParse(_controladorNumeroValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor,
          numeroConta); //Instancia o método transferência e passa como parâm as duas variáveis lidas pelo onPressed
      debugPrint("Criando transferência");
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
