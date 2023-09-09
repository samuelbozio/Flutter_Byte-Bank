import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controller;
  final String? rotulo;
  final String? dica;
  final IconData? icon;

  const Editor(
      {super.key,
      this.controller,
      this.rotulo,
      this.dica,
      this.icon}); // Contêm os TextField formatados.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: icon != null ? Icon(icon) : null,
            labelText: rotulo,
            hintText: dica),
        keyboardType:
            TextInputType.number, //Muda o teclado para número ao clicar.
      ),
    );
  }
}
