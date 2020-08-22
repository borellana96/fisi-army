import 'package:fisi_army/pages/tabs/epg.dart';
import 'package:fisi_army/pages/tabs/upg.dart';
import 'package:flutter/material.dart';
import 'package:fisi_army/pages/login_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PagosPage extends StatefulWidget {
  final String codigoAlumno;

  const PagosPage({Key key, this.codigoAlumno}) : super(key: key);

  @override
  _PagosPageState createState() => _PagosPageState();
}

class _PagosPageState extends State<PagosPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  ScrollController _scrollViewController;
  List data;
  List beneficio;

  getDescuento() async {
    var response = await http.get(
        'https://sigapdev2-consultarecibos-back.herokuapp.com/beneficio/listar/' +
            widget.codigoAlumno);

    setState(() {
      data = json.decode(response.body);
      beneficio =  data;
      debugPrint(widget.codigoAlumno);
      //if(beneficios){
      //  beneficio = beneficios[0];
      //  debugPrint(response.body);
      //  debugPrint(beneficios[0]['cod_alumno']);
      //}
      
    });
  }

  @override
  void initState() {
    super.initState();
    getDescuento();
    UpgWidget();
    EpgWidget();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var descuentoTxt = Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text("Descuento: ",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        ));

    return MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("PAGOS DEL PROGRAMA", style: TextStyle(fontSize: 18)),
          backgroundColor: Colors.indigo[900],
        ),
        body: Column(
          children: <Widget>[
            descuentoTxt,
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: beneficio == null ? 0 : beneficio.length,
              itemBuilder: (BuildContext context, int index) {
                if (beneficio.length!=0) {
                  return descuento(beneficio[index]['benef_otrogado'],beneficio[index]['autorizacion'],beneficio[index]['condicion'],beneficio[index]['fecha']);
                }else{
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text("0 Descuentos",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                    )
                  );
                }
             },
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: getTabBar(),
            ),
            Expanded(
              child: getTabBarView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget descuento(benef_otrogado, autorizacion, condicion,fecha) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              dato("BENEFICIO", "${benef_otrogado}%")
            ]
          ),
          SizedBox(height: 20),
          Row(
            children:<Widget> [
              Padding(
              padding: const EdgeInsets.all(7.0),
              child: dato("AUTORIZACIÓN", "${autorizacion}"),
              ),
              Padding(
              padding: const EdgeInsets.all(7.0),
              child:
              dato("CONDICIÓN", "${condicion}"),
              ),
              Padding(
              padding: const EdgeInsets.all(7.0),
              child:
              dato("FECHA", "${fecha}"),
              )
            ]
          )
        ],
      ),
    );
  }
  Widget dato(String nombre,String valor){
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text("${nombre}",
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
            )
          ]
        ),
        Row(
          children: <Widget>[
            Text("${valor}",
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500))
          ]
        )
      ]
    );
  }
  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[Tab(text: "EPG"), Tab(text: "UPG")],
      controller: _controller,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black54,
    );
  }

  TabBarView getTabBarView() {
    return TabBarView(
      controller: _controller,
      children: <Widget>[
        EpgWidget(codigoAlumno: widget.codigoAlumno),
        UpgWidget(codigoAlumno: widget.codigoAlumno)
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget cancelButton = FlatButton(
      child: Text(
        "Seguir aqui",
        style: TextStyle(fontSize: 15.0),
      ),
      onPressed: () => Navigator.pop(context),
      color: Colors.indigo,
    );
    Widget okButton = FlatButton(
      child: Text(
        "Cerrar Sesion",
        style: TextStyle(fontSize: 15.0),
      ),
      onPressed: () => {
        Navigator.pop(context),
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        )
      },
      color: Colors.redAccent,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cerrar Sesion"),
      content: Text("Esta Seguro que desea cerrar sesion?"),
      actions: [okButton, cancelButton],
      elevation: 24.0,
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
