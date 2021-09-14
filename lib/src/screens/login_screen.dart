import 'package:flutter/material.dart';
import 'package:practica2/src/screens/dashboard_screen.dart';
import 'package:practica2/src/utils/color_settings.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var isLoading = false;
  TextEditingController txtEmailCon = TextEditingController();
  TextEditingController txtPassCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextFormField txtEmail = TextFormField(
      controller: txtEmailCon,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Introduce el email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
    );

    TextFormField password = TextFormField(
      controller: txtPassCon,
      keyboardType: TextInputType.visiblePassword,
      maxLength: 8,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Introduce password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
    );

    ElevatedButton button = ElevatedButton(
      style: ElevatedButton.styleFrom(primary: ColorSettings.colorButton),
      onPressed: () {
        print(txtEmailCon.text + ' ' + txtPassCon.text);
        isLoading = true;
        setState(() {});
        Future.delayed(Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => dashboard_screen()));
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Icon(Icons.login), Text('Validar datos')],
      ),
    );
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/spidy.jpg'))),
        ),
        //LayoutBuilder(//profe
        //  builder: (BuildContext context, BoxConstraints constraints) {
        //return SingleChildScrollView(
        //child:
        Card(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                txtEmail,
                SizedBox(
                  height: 5,
                ),
                password,
                button
              ],
            ),
          ),
        ),
        //);
        //}
        //),
        Positioned(
          child: Image.asset(
            'assets/itc.png',
            width: 120,
          ),
          top: 120,
        ),
        Positioned(
          child: isLoading == true ? CircularProgressIndicator() : Container(),
          top: 300,
        )
      ],
    );
  }
}
