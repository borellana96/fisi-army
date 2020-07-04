import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      //theme: ThemeData(primaryColor: Color.fromRGBO(20, 94, 179, 100)),
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/logo-unmsm.png',
            height: 45.0,
          ),
          actions: <Widget>[
            InkWell(
                onTap: () {
                  print("Me tocaste, denunciado");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(Icons.exit_to_app),
                ))
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120.0),
                child: Image.asset(
                  'assets/images/logo-unmsm.png',
                  height: 100,
                ),
              ),
            ),
            Container(
              child: Text("Hola ctm, soy tu usuario"),
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.person_pin),
                      Text('Perfil'),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      print("Muestro los pagos");
                    },
                    child: Column(
                      children: [
                        Icon(Icons.payment),
                        Text('Pago'),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(Icons.settings),
                      Text('Ajustes'),
                    ],
                  ),
                ],
              ),
            ),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.blueAccent[100]),
                  //width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Text(
                    'Programas cursados',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
            /*Row(
              children: <Widget>[
                Container(
                  child: Text('Programas cursados'),
                )
              ],
            )*/
          ],
        ),
      ),
    );
  }
}
