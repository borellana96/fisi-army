import 'package:fisi_army/models/detallePago_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPayPage extends StatefulWidget {
  final String codigoAlumno;

  const DetailPayPage({Key key, this.codigoAlumno}) : super(key: key);
  @override
  _DetailPayPageState createState() => _DetailPayPageState();
}

class _DetailPayPageState extends State<DetailPayPage> {
  String icono;
  String color;
  List data;
  List usersData;
  Color primary = Colors.indigo[900];
  final secondary = Color(0xfff29a94);
  getUsers() async {
    http.Response response = await http.get(
        'https://sigapdev2-consultarecibos-back.herokuapp.com/recaudaciones/alumno/concepto/listar_cod/'+widget.codigoAlumno);
        
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
        title: Text('DETALLE DE PAGOS PROGRAMA',style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.indigo[900],

      ),
      body:ListView.builder(
        itemCount: usersData == null ? 0 : usersData.length,
        itemBuilder: (BuildContext context, int index){
          if(usersData[index]['validado']){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "${usersData[index]['concepto']}",
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500)
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "${usersData[index]['idRec']}",
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500)
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "${usersData[index]['fecha']}",
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500)
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "${usersData[index]['moneda2']}",
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500)
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "${usersData[index]['moneda']}",
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500)
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Icon(Icons.check, color: Colors.green,)
                    )
                  ]
                )
              )
            );
          }else{
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "${usersData[index]['concepto']}",
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500)
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "${usersData[index]['idRec']}",
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500)
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "${usersData[index]['fecha']}",
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500)
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "${usersData[index]['moneda2']}",
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500)
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "${usersData[index]['moneda']}",
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500)
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Icon(Icons.close, color: Colors.red)
                    )
                  ]
                )
              )
            );
          }
          
        }
      )
    );
  }
  

}