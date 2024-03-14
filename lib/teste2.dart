import 'package:flutter/material.dart';
import 'package:teste/teste.dart';

class TelaInicio extends StatefulWidget {
  @override
  _TelaInicioState createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  TextEditingController _valor = TextEditingController();
  bool _aprovacao = false;
  bool _escolha = false;
  double _slider = 0;
  String label = "0";
  int _escolhaRadio = 0;
  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
        backgroundColor: Color.fromARGB(255, 108, 84, 168),
        foregroundColor: Colors.black,
        shape: Border.all(width: 3, color: Color.fromARGB(255, 146, 134, 236)),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Digite o Valor"),
              style: TextStyle(fontSize: 30, color: Colors.blue),
              //enabled: true, enable realiza ativação ou inativação
              //obscureText: true, obscure texte realiza a anonimização do valor
              controller: _valor,
            ),
          ),

          ElevatedButton(
              child: Text("Salvar"),
              onPressed: () {
                print("Valor digitado = " + _valor.text);
              }),

          CheckboxListTile(
            title: Text("Aprovação Aluno"),
            selected: true,
            value: _aprovacao,
            onChanged: (bool? valor) {
              setState(() {
                _aprovacao = valor!;
              });
            },
          ),

          Switch(
              value: _escolha,
              onChanged: (bool? valor) {
                setState(() {
                  _escolha = valor!;
                });
              }),

          Slider(
              min: 0,
              max: 10,
              divisions: 10,
              label: label,
              value: _slider,
              onChanged: (double novoValor) {
                setState(() {
                  _slider = novoValor;
                  label = novoValor.toString();
                });
              }),

          RadioListTile(
              title: Text("Masculino"),
              value: 1,
              groupValue: _escolhaRadio,
              onChanged: (int? escolha) {
                setState(() {
                  _escolhaRadio = escolha!;
                });
              }),

          RadioListTile(
              title: Text("Feminino"),
              value: 2,
              groupValue: _escolhaRadio,
              onChanged: (int? escolha) {
                setState(() {
                  _escolhaRadio = escolha!;
                });
              }),
              ElevatedButton(
              child: Text("Confirmar"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => teste())); 
              }),
        ],
      ),
    );
  }
}