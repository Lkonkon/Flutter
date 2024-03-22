import 'package:flutter/material.dart';
import 'package:teste/Menu.dart';
import 'package:teste/Menu2.dart';
import 'package:teste/Notificacao.dart';
import 'package:teste/_comum/minhas_cores.dart';
import 'package:teste/cadastroUsuario.dart';
import 'package:teste/models/local_source.dart';
import 'package:teste/models/user_model.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLogin createState() => _TelaLogin();
}

class _TelaLogin extends State<TelaLogin> {
  @override
  // ignore: override_on_non_overriding_member
  final Notificacao _notificacao = Notificacao();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
    final LocalDataSource _localDataSource = LocalDataSource();



  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                ],
              ),
            ),
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
              child: TextField(
                controller: _controllerEmail,
                style: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                cursorColor: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 420,
            left: 50,
            right: 50,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black, width: 2),
                color: Color.fromARGB(255, 207, 203, 203),
              ),
              child: TextField(
                controller: _controllerSenha,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Senha",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                obscureText: true,
              ),
            ),
          ),
          Positioned(
            bottom: 240,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: (){login();},
                  child: const Text("Entrar",
                      style: TextStyle(fontSize: 20, fontFamily: 'Kanit')),
                ),
              ),
            ),
          ),
         const Divider(),
          Positioned(
            bottom: 200,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 85),
              child: TextButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => cadastroUsuario())); 
                },
                child: const Text(
                  "Não Possui Conta? Cadastre-se",
                  style: TextStyle(
                      color: Colors.black, decorationColor: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



  
 Future<void> login()  async {
    if (!_controllerEmail.text.isNotEmpty) {
      final notificacao = _notificacao.showCustomSnackbar('Informe o e-mail do seu usuário!', Color.fromARGB(255, 197, 15, 15), Color.fromARGB(255, 255, 255, 255));
      ScaffoldMessenger.of(context).showSnackBar(notificacao);
      return;
    }

    if (!_controllerSenha.text.isNotEmpty){
      final notificacao = _notificacao.showCustomSnackbar('Informe sua senha por gentileza!', Color.fromARGB(255, 201, 15, 15), Color.fromARGB(255, 255, 255, 255));
      ScaffoldMessenger.of(context).showSnackBar(notificacao);
      return;
    }

    bool loginSuccess = await _localDataSource.verifyLogin(_controllerEmail.text.toString(), _controllerSenha.text.toString());

    if (loginSuccess){
      final notificacao = _notificacao.showCustomSnackbar('Login realizado com sucesso!', Color.fromARGB(255, 32, 133, 28), Color.fromARGB(255, 0, 0, 0));
      ScaffoldMessenger.of(context).showSnackBar(notificacao);
      User? user = await _localDataSource.getUserByMail(_controllerEmail.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Menu2()));
    }else {
      final notificacao = _notificacao.showCustomSnackbar('Usuário não encontrado na base de dados!', Colors.red, Colors.white);
      ScaffoldMessenger.of(context).showSnackBar(notificacao);
      return;
    }
}
}


