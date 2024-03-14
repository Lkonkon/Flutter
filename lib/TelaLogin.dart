import 'package:flutter/material.dart';
import 'package:teste/_comum/minhas_cores.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLogin createState() => _TelaLogin();
}

class _TelaLogin extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 134, 40, 221),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  MinhasCores.roxoTopoGradiante,
                  MinhasCores.roxoBaixoGradiante,
                ])),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(horizontal: 80, vertical: 170),
            child: const Text(
              "Login",
              style: TextStyle(
                  fontFamily: 'Pacifico', fontSize: 80, color: Colors.black),
            ),
          ),
          Positioned(
            top: 350,
            left: 50,
            right: 50,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black, width: 2),
                color: Color.fromARGB(255, 207, 203, 203),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                cursorColor: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 450,
            left: 50,
            right: 50,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black, width: 2),
                color: Color.fromARGB(255, 207, 203, 203),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20)
                ),
                obscureText: true,
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Entrar",
                      style: TextStyle(fontSize: 20, fontFamily: 'Kanit')),
                ),
              ),
            ),
          ),
          Divider(),
          Positioned(
            bottom: 150,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Não Possui Conta? Cadastre-se",
                  style: TextStyle(
                      color: Colors.black,
                      decorationColor: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
