import 'package:flutter/material.dart';
import '../models/transferencia.dart';
import 'formulario_transferencia.dart';

class ListaTransferencia extends StatefulWidget {
  const ListaTransferencia({super.key});

  @override
  State<ListaTransferencia> createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
  final List<Transferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            final Future future =
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              //Cria uma função de navegação entre páginas ao apertar o botão.
              return const FormularioTransferencia();
            }));
            future.then(
              (transferenciaRecebida) {
                setState(() {
                  if (transferenciaRecebida != null) {
                    _transferencias.add(transferenciaRecebida);
                  }
                });
              },
            );
          },
        ),
        appBar: AppBar(
          title: const Text("Lista de Transferências"),
        ),
        body: ListView.builder(
            itemCount: _transferencias.length,
            itemBuilder: (context, index) {
              final transferencia = _transferencias[index];
              return ItemTransferencia(transferencia);
            }));
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;
  const ItemTransferencia(this._transferencia, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
