import 'package:fisi_army/pages/detallesPago_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpgWidget extends StatefulWidget {
  final String codigoAlumno;

  const UpgWidget({Key key, this.codigoAlumno}) : super(key: key);
  @override
  _UpgWidgetState createState() => _UpgWidgetState();
}

class _UpgWidgetState extends State<UpgWidget> {
  String icono;
  String color;
  List data;
  List usersData;
  Color primary = Colors.indigo[900];
  final secondary = Color(0xfff29a94);
  getUsers() async {
    http.Response response = await http.get(
        'https://sigapdev2-consultarecibos-back.herokuapp.com/recaudaciones/alumno/concepto/listar_cod/' +
            widget.codigoAlumno);

    setState(() {
      data = json.decode(response.body);
      usersData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('DETALLE DE PAGOS PROGRAMA', style: TextStyle(fontSize: 18)),
          backgroundColor: Colors.indigo[900],
        ),
        body: ListView.builder(
            itemCount: usersData == null ? 0 : usersData.length,
            itemBuilder: (BuildContext context, int index) {
              if (usersData[index]['c_id_tipo_recaudacion'] == 1) {
                if (usersData[index]['validado']) {
                  return Card(
                      child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetallePage()));
                            },
                            child: Row(children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Text("${usersData[index]['concepto']}",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500))),
                              Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text("${usersData[index]['idRec']}",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500))),
                              Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text("${usersData[index]['fecha']}",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500))),
                              Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text("${usersData[index]['moneda2']}",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500))),
                              Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text("${usersData[index]['importe']}",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500))),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Icon(Icons.check_circle,
                                      color: Colors.green),
                                ),
                              )
                            ]),
                          )));
                } else {
                  return Card(
                      child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text("${usersData[index]['concepto']}",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))),
                            Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("${usersData[index]['idRec']}",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))),
                            Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("${usersData[index]['fecha']}",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))),
                            Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("${usersData[index]['moneda2']}",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500))),
                            Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "${usersData[index]['importe']}",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500),
                                )),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                              ),
                            )
                          ])));
                }
              } else {
                return Divider(height: 2.0);
              }
            }));
  }
}
