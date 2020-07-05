import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class DetailPage extends StatefulWidget{


  @override
  _DetailPageState createState() => _DetailPageState();


}

class _DetailPageState extends State<DetailPage>{

  List data;
  List usersData;
  //getUsers()async{
  //  http.Response response = await http.get('http://192.168.1.10:3000/api/users');
  //  data = json.decode(response.body);
  //  setState(() {
  //    usersData = data[];
  //  });
  //}
  getUsers()async{
    http.Response response = await http.get('https://sigapdev2-consultarecibos-back.herokuapp.com/recaudaciones/alumno/concepto/listar_cod/18207001');
    //debugPrint(response.body);
    data = json.decode(response.body);
    //debugPrint("${data[0]}");
    setState(() {
      usersData = data;
    });
  }

  @override
  void initState() { 
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DETALLE DE PAGOS'),
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView.builder(
        itemCount: usersData == null ? 0 : usersData.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("${usersData[index]['idRec']}",
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("${usersData[index]['fecha']}",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("${usersData[index]['moneda2']}",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("${usersData[index]['moneda']}",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("${usersData[index]['validado']}",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700
                    ),),
                  )   
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}