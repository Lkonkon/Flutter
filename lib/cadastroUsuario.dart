import 'package:flutter/material.dart';
import 'package:teste/Notificacao.dart';
import 'package:teste/TelaLogin.dart';
import 'package:teste/_comum/minhas_cores.dart';
import 'package:teste/models/local_source.dart';


class cadastroUsuario extends StatefulWidget {
  @override
  _cadastroUsuario createState() => _cadastroUsuario ();
}

class _cadastroUsuario extends State<cadastroUsuario > {  
  @override
  final Notificacao _notificacao = Notificacao();
  TextEditingController _controllerUsuario = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha1 = TextEditingController();
  TextEditingController _controllerSenha2 = TextEditingController();
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
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 170),
            child: const Text(
              "Cadastre-se",
              style: TextStyle(
                  fontFamily: 'Pacifico', fontSize: 60, color: Colors.black),
            ),
          ),
          Positioned(
            top: 270,
            left: 50,
            right: 50,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black, width: 2),
                color: Color.fromARGB(255, 207, 203, 203),
              ),
              child: TextField(
                controller: _controllerUsuario,
                style: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Usuario",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                cursorColor: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 340,
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
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Email",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                obscureText: false,
              ),
            ),
          ),
          Positioned(
            top: 410,
            left: 50,
            right: 50,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black, width: 2),
                color: Color.fromARGB(255, 207, 203, 203),
              ),
              child: TextField(
                controller: _controllerSenha1,
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
            top: 480,
            left: 50,
            right: 50,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black, width: 2),
                color: Color.fromARGB(255, 207, 203, 203),
              ),
              child: TextField(
                controller: _controllerSenha2,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Confirme sua Senha",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                obscureText: true,
              ),
            ),
          ),
          Positioned(
            bottom: 180,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: (){cadastrar();},
                  child: const Text("Cadastrar",
                      style: TextStyle(fontSize: 20, fontFamily: 'Kanit')),
                ),
              ),
            ),
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
        ],
      ),
    );
  }



  
 Future<void> cadastrar()  async {
    if (!_controllerUsuario.text.isNotEmpty) {
      final notificacao = _notificacao.showCustomSnackbar('Informe o seu nome de usuário!', Color.fromARGB(255, 197, 15, 15), Color.fromARGB(255, 255, 255, 255));
      ScaffoldMessenger.of(context).showSnackBar(notificacao);
      return;
    }

    if (!_controllerEmail.text.isNotEmpty) {
      final notificacao = _notificacao.showCustomSnackbar('Informe o e-mail do seu usuário!', Color.fromARGB(255, 197, 15, 15), Color.fromARGB(255, 255, 255, 255));
      ScaffoldMessenger.of(context).showSnackBar(notificacao);
      return;
    }

    if (!_controllerSenha1.text.isNotEmpty){
      final notificacao = _notificacao.showCustomSnackbar('Informe sua senha por gentileza!', Color.fromARGB(255, 201, 15, 15), Color.fromARGB(255, 255, 255, 255));
      ScaffoldMessenger.of(context).showSnackBar(notificacao);
      return;
    }

    if (!_controllerSenha2.text.isNotEmpty){
      final notificacao = _notificacao.showCustomSnackbar('Confirme sua senha por gentileza!', Color.fromARGB(255, 201, 15, 15), Color.fromARGB(255, 255, 255, 255));
      ScaffoldMessenger.of(context).showSnackBar(notificacao);
      return;
    }

    if (_controllerSenha1.text != _controllerSenha2.text){
      final notificacao = _notificacao.showCustomSnackbar('As senhas não sao as mesmas', Color.fromARGB(255, 201, 15, 15), Color.fromARGB(255, 255, 255, 255));
      ScaffoldMessenger.of(context).showSnackBar(notificacao);
      return;
    }

        bool regiserUserSuccess = await _localDataSource.registerUser(_controllerUsuario.text.toString(), _controllerEmail.text.toString(), _controllerSenha1.text.toString());


    if (regiserUserSuccess){
      final notificacao = _notificacao.showCustomSnackbar('Cadastro realizado com sucesso', Color.fromARGB(255, 32, 133, 28), Color.fromARGB(255, 0, 0, 0));
      ScaffoldMessenger.of(context).showSnackBar(notificacao);
      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaLogin())); 
      return;
    }else {
      final notificacao = _notificacao.showCustomSnackbar('Falha ao tentar registrar usuário!', Colors.red, Colors.white);
      ScaffoldMessenger.of(context).showSnackBar(notificacao);
}

}

}
