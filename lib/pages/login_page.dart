import 'package:fisi_army/main.dart';
import 'package:fisi_army/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:fisi_army/pages/home_page.dart';

import 'dart:async';
import 'dart:convert';
import 'package:fisi_army/states/login_state.dart';

const mainColor = Color(0xff2470c7);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //editar modal
  createAlertDialogOlvidePassword(BuildContext context) {
    TextEditingController usuarioControler = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Ingrese su usuario"),
            content: TextField(
              controller: usuarioControler,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text("Recuperar"),
                onPressed: () {
                  //Se ejecurta cuando hace click el recuperar

                  //1 - llamar los campos

                  //2- juntar en la api
                  //3- hacer peticion
                  //4- si devilve 200 ok! restablecio a dni
                  //5-si hay error avisar
                },
              )
            ],
          );
        });
  }

  String email, password;
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'POSGRADO',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: mainColor,
            ),
            labelText: 'Username'),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: mainColor,
          ),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            //lamar modal recuperar contraseña
          },
          child: Text("Recuperar Contraseña"),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () async {
              var url =
                  "https://sigapdev2-consultarecibos-back.herokuapp.com/usuario/alumnoprograma/buscar/" +
                      password +
                      "/" +
                      email;
              url = url.trim();
              debugPrint(url);

              var response = await http.get(url);
              if (response.statusCode == 200) {
                debugPrint("Existe");
                var state = Provider.of<LoginState>(context);

                state.username = email;
                state.password = password;
                state.setLoggedIn(true);
                state.perfil = json.decode(response.body);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              } else {
                debugPrint("NO EXISTE O ERROR EN REQUEST");
                //ocurrio un error o datos invalidos
              }
            },
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  /*Widget _buildOrRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            '- OR -',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }*/

  /*Widget _buildSocialBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
            onTap: () {},
            child: Consumer<LoginState>(
              builder: (BuildContext context, LoginState value, Widget child) {
                if (value.isLoading()) {
                  return CircularProgressIndicator();
                } else {
                  return child;
                }
              },
              child: RaisedButton.icon(
                icon: Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                onPressed: () {
                  Provider.of<LoginState>(context).login();
                },
                splashColor: Colors.amber,
                color: Colors.redAccent,
                label: Text('GOOGLE'),
              ),
            ))
      ],
    );
  }
*/
  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Iniciar sesion",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ],
                ),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildForgetPasswordButton(),
                _buildLoginButton(),
                //_buildOrRow(),
                //_buildSocialBtnRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //Widget _buildSignUpBtn() {
  //  return Row(
  //    mainAxisAlignment: MainAxisAlignment.center,
  //    children: <Widget>[
  //      Padding(
  //        padding: EdgeInsets.only(top: 40),
  //        child: FlatButton(
  //          onPressed: () {},
  //          child: RichText(
  //            text: TextSpan(children: [
  //              TextSpan(
  //                text: 'Dont have an account? ',
  //                style: TextStyle(
  //                  color: Colors.black,
  //                  fontSize: MediaQuery.of(context).size.height / 40,
  //                  fontWeight: FontWeight.w400,
  //                ),
  //              ),
  //              TextSpan(
  //                text: 'Sign Up',
  //                style: TextStyle(
  //                  color: mainColor,
  //                  fontSize: MediaQuery.of(context).size.height / 40,
  //                  fontWeight: FontWeight.bold,
  //                ),
  //              )
  //            ]),
  //          ),
  //        ),
  //      ),
  //    ],
  //  );
  //}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLogo(),
                _buildContainer(),
                //_buildSignUpBtn(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//Center(
//     child: Consumer<LoginState>(
//           builder: (BuildContext context , LoginState value , Widget child){
//             if(value.isLoading()){
//               return CircularProgressIndicator();
//             }else {
//               return child;
//             }
//           },
//           child: RaisedButton(
//             child: Text("Sign In"),
//             onPressed: (){
//               Provider.of<LoginState>(context).login();
//             }
//           ),
//         )
//      ),
