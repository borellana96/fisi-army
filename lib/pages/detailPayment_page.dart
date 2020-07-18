import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List data;
  List usersData;

  getUsers() async {
    http.Response response = await http.get(
        'https://sigapdev2-consultarecibos-back.herokuapp.com/alumnoprograma/buscard/08884699');
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
        title: Text('Programas Cursados'),
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView.builder(
        itemCount: usersData == null ? 0 : usersData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "${usersData[index]['idPrograma']}",
                      style: TextStyle(
                          fontSize: 10.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "${usersData[index]['nom_programa']}",
                      style: TextStyle(
                          fontSize: 10.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "${usersData[index]['siglaProg']}",
                      style: TextStyle(
                          fontSize: 10.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: RaisedButton(
                      elevation: 2.0,
                      color: Colors.indigo[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      onPressed: null,
                      child: Text(
                        "Ver Más",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: MediaQuery.of(context).size.height / 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

//ListView.builder(
//  itemCount: usersData == null ? 0 : usersData.length,
//  itemBuilder: (BuildContext context, int index){
//    return Card(
//      child: Padding(
//        padding: const EdgeInsets.all(12.0),
//        child: Row(
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(12.0),
//              child: Text("${usersData[index]['idRec']}",
//                style: TextStyle(
//                  fontSize: 10.0,
//                  fontWeight: FontWeight.w500
//                ),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(10),
//              child: Text("${usersData[index]['fecha']}",
//              style: TextStyle(
//                fontSize: 10.0,
//                fontWeight: FontWeight.w700
//              ),),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(10),
//              child: Text("${usersData[index]['moneda2']}",
//              style: TextStyle(
//                fontSize: 10.0,
//                fontWeight: FontWeight.w700
//              ),),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(10),
//              child: Text("${usersData[index]['moneda']}",
//              style: TextStyle(
//                fontSize: 10.0,
//                fontWeight: FontWeight.w700
//              ),),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(10),
//              child: Text("${usersData[index]['validado']}",
//              style: TextStyle(
//                fontSize: 10.0,
//                fontWeight: FontWeight.w700
//              ),),
//            )
//          ],
//        ),
//      ),
//    );
//  },
//),
