
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class teste extends StatefulWidget{
  @override
  _teste createState()=> _teste();

  
}

class _teste extends State<teste>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste"),
        backgroundColor: Color.fromARGB(255, 134, 40, 221), //Muda a da barra de fundo
        foregroundColor: Color.fromARGB(255, 0, 0, 0), //Muda a cor do testo dentro da barra
        shape: Border.all(width: 3, color: Color.fromARGB(255, 68, 14, 170)), //Cria uma borda na barra
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        children:<Widget> [
          Padding(padding: EdgeInsets.all(20),
          child: TextField(keyboardType: TextInputType.emailAddress,),
          ),
          ElevatedButton(
              child: Text("Confirmar"),
              onPressed: () {
                Navigator.pop(context); 
                }),
          ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.shopping_basket_rounded), label: Text("Produtos"))
        ],
        ), 
    );
  }
}
