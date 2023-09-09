import 'package:appteste/screens/lista_transferencia.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Scaffold(
        body: ListaTransferencia(),
      ),
    )
  );
