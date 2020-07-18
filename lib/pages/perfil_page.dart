import 'package:flutter/material.dart';

class PerfilUsuario extends StatelessWidget {

  final  Map<String, dynamic>  usuario;

  const PerfilUsuario({Key key, this.usuario}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    String email;
    if(usuario['mail']==null)
      email = "SIN CORREO ELECTRONICO";
    else
      email = usuario['mail'];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DATOS PERSONALES'),
          backgroundColor: Colors.indigo[900],
          //bottom: getTabBar(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
              ListTile(
                title: Text("Usuario",
                style: TextStyle(
                   fontWeight: FontWeight.w500)
                ),
                subtitle: Text(usuario['userName']),
                leading: Icon(Icons.vpn_key),
              ),
              ListTile(
                title: Text("Codigo Usuario",
                style: TextStyle(
                   fontWeight: FontWeight.w500)
                ),
                subtitle: Text(usuario['codAlumno']),
                leading: Icon(Icons.filter_center_focus),
              ),
              ListTile(
                title: Text("Nombre Completo",
                style: TextStyle(
                   fontWeight: FontWeight.w500)
                ),
                subtitle: Text(usuario['nomAlumno']+" "+usuario['apePaterno']),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text("Correo",
                style: TextStyle(
                   fontWeight: FontWeight.w500)
                ),
                subtitle: Text(email),
                leading: Icon(Icons.email),
              ),
              ListTile(
                title: Text("DNI",
                style: TextStyle(
                   fontWeight: FontWeight.w500)
                ),
                subtitle: Text(usuario['dniM']),
                leading: Icon(Icons.chrome_reader_mode),
              )
          ],
        ),
      ),
    );
  }
}