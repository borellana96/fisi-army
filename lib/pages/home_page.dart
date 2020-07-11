import 'package:fisi_army/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var perfil;
  var programas;

  createAlertDialog(BuildContext context) {
    TextEditingController customControler = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Ingrese su codigo"),
            content: TextField(
              controller: customControler,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text("Buscar"),
                onPressed: () {},
              )
            ],
          );
        });
  }

  traerData(String url) async {
    return await http.get(url);
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<LoginState>(context);
    var ga = json.encode(state.perfil);
    var perfil = json.decode(ga);
    //traer datos del usuario
    var urlProgramas =
        "https://sigapdev2-consultarecibos-back.herokuapp.com/recaudaciones/alumno/concepto/listar_codigoslog/" +
            perfil['apePaterno'].toString() +
            "/" +
            perfil['codAlumno'].toString();
    urlProgramas = urlProgramas.trim();
    debugPrint("gaaa");
    debugPrint(urlProgramas);
    var res = traerData(urlProgramas);
    /*await http.get(urlProgramas).then((value) =>
        {res = json.decode(value.body), debugPrint(res[0]['cod_alumno'])});*/
    //var resp = traerData(urlProgramas);
    setState(() {
      programas = res;
    });
    debugPrint("owo");
    //debugPrint(programas[0]['cod_alumno']);
    return MaterialApp(
      title: 'Welcome to Flutter',
      //theme: ThemeData(primaryColor: Color.fromRGBO(20, 94, 179, 100)),
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/logounmsm.png',
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
                  'assets/logounmsm.png',
                  height: 100,
                ),
              ),
            ),
            Container(
              child: Text("Hola Jorge, soy tu usuario"),
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
                      Navigator.of(context).pushNamed('/add');
                    },
                    child: Column(
                      children: [
                        Icon(Icons.payment),
                        Text('Pagos'),
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
            /*Container(
              child: ListView.builder(
                itemCount: programas == null ? 0 : programas.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "${programas[index]['cod_alumno']}",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ]),
                    ),
                  );
                },
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
