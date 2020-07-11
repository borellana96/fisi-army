import 'package:fisi_army/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color mainColor =  Colors.indigo[900];
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
              Icons.person,
              color: mainColor,
            ),
            labelText: 'Usuario'),
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
          labelText: 'Contraseña',
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text("Cambiar contraseña",
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),),
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
          margin: EdgeInsets.all(2.0),
          child: RaisedButton(
            elevation: 5.0,
            color: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            onPressed: () {},
            child: Text(
              "Ingresar",
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

  Widget _buildOrRow() {
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
  }

  Widget _buildSocialBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child:Consumer<LoginState>(
           builder: (BuildContext context , LoginState value , Widget child){
             if(value.isLoading()){
               return CircularProgressIndicator();
             }else {
               return child;
             }
           },
           child: RaisedButton.icon(
             icon: Icon(
              FontAwesomeIcons.google,
              color: Colors.white,
            ),
             onPressed: (){
               Provider.of<LoginState>(context).login();
             },
            splashColor: Colors.amber,
            color: Colors.redAccent, 
            label: Text('GOOGLE'),
              
           ),
         )
        )
      ],
    );
  }

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
                      "Iniciar Sesion",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ],
                ),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildLoginButton(),
                _buildForgetPasswordButton(),
                SizedBox(height: 30),
                _buildOrRow(),
                _buildSocialBtnRow(),
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