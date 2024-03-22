import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste/_comum/minhas_cores.dart';

class Menu2 extends StatefulWidget {
  @override
  _Menu2 createState() => _Menu2();
}

class _Menu2 extends State<Menu2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 134, 40, 221),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                MinhasCores.roxoTopoGradiante,
                MinhasCores.roxoBaixoGradiante,
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(horizontal: 80, vertical: 100),
          child: const Text(
            "Menu",
            style: TextStyle(
                fontFamily: 'Kanit', fontSize: 50, color: Colors.black),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 200),
          child: SizedBox(
              height: 100,
              width: 180,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    iconSize: MaterialStatePropertyAll(40),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                onPressed: () {},
                icon: const Icon(Icons.shopping_basket_rounded),
                label: Text("Produtos"),
              )),
        ),
        Positioned(
          top: 200,
          right: 10,
          child: SizedBox(
              height: 100,
              width: 180,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    iconSize: MaterialStatePropertyAll(40),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                onPressed: () {},
                icon: const Icon(Icons.person),
                label: Text("Clientes"),
              )),
        ),
        Positioned(
          top: 310,
          right: 10,
          child: SizedBox(
              height: 100,
              width: 180,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    iconSize: MaterialStatePropertyAll(40),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                onPressed: () {},
                icon: const Icon(Icons.assignment_add),
                label: Text("Pedidos"),
              )),
        ),
        Positioned(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: IconButton(onPressed:(){
                Navigator.pop(context);
              } ,icon: Icon(Icons.arrow_back_rounded),color: Colors.black,
              ),
            ),
          ),
      ]),
    );
  }
}
