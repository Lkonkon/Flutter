import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Menu extends StatefulWidget {
  @override
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
          backgroundColor:
              Color.fromARGB(255, 134, 40, 221), //Muda a da barra de fundo
          foregroundColor: Color.fromARGB(
              255, 0, 0, 0), //Muda a cor do testo dentro da barra
          shape: Border.all(
              width: 3,
              color:
                  Color.fromARGB(255, 68, 14, 170)), //Cria uma borda na barra
        ),
        body: SafeArea(
          child: SizedBox(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 50,
                      width: 200,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                        ))
                        ),
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_basket_rounded),
                      label: Text("Produtos"),
                    )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: SizedBox(
                      height: 50,
                      width: 200,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                        ))
                        ),
                      onPressed: () {},
                      icon: const Icon(Icons.person),
                      label: Text("Clientes"),
                    ),
                  ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: SizedBox(
                      height: 50,
                      width: 200,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        )),
                        ),
                      onPressed: () {},
                      icon: const Icon(Icons.assignment_add),
                      label: Text("Pedidos"),
                    )
                    ),
                  ),
                ]),
          ),
        ));
  }
}
