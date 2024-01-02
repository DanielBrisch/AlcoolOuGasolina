import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: Image.asset("img/logo.png"),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço Alcool, ex: 1.59",
            ),
            style: TextStyle(
              fontSize: 22
            ),
            controller: _controllerAlcool,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço Gasolina, ex: 1.90"
            ),
            style: TextStyle(
              fontSize: 22
            ),
            controller: _controllerGasolina,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: ElevatedButton(child: Text("Calcular"), onPressed: () {}),
          ),
        ]),
      ),
    );
  }
}
