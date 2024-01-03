import 'dart:ffi';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String resposta = "";

  void realizaCalculo() {
    if (!_controllerAlcool.text.isEmpty && !_controllerGasolina.text.isEmpty) {
      double alcoolNum = double.parse(_controllerAlcool.text);
      double gasolinaNum = double.parse(_controllerGasolina.text);
      setState(() {
        if (alcoolNum < gasolinaNum) {
          resposta = "A gasolina está compensando mais";
        } else {
          resposta = "O alcool está compensando mais";
        }
      });
    } else {
      setState(() {
        resposta = "Por favor informe os valores";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
              child: Image.asset("img/logo.png"),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(16, 25, 16, 16),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Preço Alcool, ex: 1.59",
                    labelStyle: TextStyle(color: Colors.blue)),
                style: const TextStyle(fontSize: 22),
                controller: _controllerAlcool,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Preço Gasolina, ex: 1.90",
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    )),
                style: const TextStyle(fontSize: 22),
                controller: _controllerGasolina,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.fromLTRB(142, 10, 142, 10),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                onPressed: () {
                  realizaCalculo();
                },
                child: const Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                resposta,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
