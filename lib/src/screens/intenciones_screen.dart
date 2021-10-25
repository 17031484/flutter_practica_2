import 'package:flutter/material.dart';
import 'package:practica2/src/utils/color_settings.dart';
import 'package:url_launcher/url_launcher.dart';

class intencionesScreen extends StatefulWidget {
  intencionesScreen({Key? key}) : super(key: key);

  @override
  _intencionesScreenState createState() => _intencionesScreenState();
}

class _intencionesScreenState extends State<intencionesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inteciones implicitas'),
        backgroundColor: ColorSettings.colorPrimary,
      ),
      body: ListView(
        children: [
          Card(
            elevation: 8.0,
            child: ListTile(
              tileColor: Colors.greenAccent,
              title: Text('Abrir pagina web'),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.touch_app_rounded,
                    size: 18.0,
                    color: Colors.red,
                  ),
                  Text('https://celaya.tecnm.mx/'),
                ],
              ),
              leading: Container(
                height: 40.0,
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.language, color: Colors.black),
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(width: 1.0))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: _abrirWeb,
            ),
          ),
          Card(
            elevation: 8.0,
            child: ListTile(
              tileColor: Colors.greenAccent,
              title: Text('Llamada telefónica'),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.touch_app_rounded,
                    size: 18.0,
                    color: Colors.red,
                  ),
                  Text('4661088391'),
                ],
              ),
              leading: Container(
                height: 40.0,
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.phone_android, color: Colors.black),
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(width: 1.0))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 8.0,
            child: ListTile(
              tileColor: Colors.greenAccent,
              title: Text('Enviar mensaje SMS'),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.touch_app_rounded,
                    size: 18.0,
                    color: Colors.red,
                  ),
                  Text('4661088391'),
                ],
              ),
              leading: Container(
                height: 40.0,
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.sms_sharp, color: Colors.black),
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(width: 1.0))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 8.0,
            child: ListTile(
              tileColor: Colors.greenAccent,
              title: Text('Enviar email'),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.touch_app_rounded,
                    size: 18.0,
                    color: Colors.red,
                  ),
                  Text('To: 17031484@itcelaya.edu.mx'),
                ],
              ),
              leading: Container(
                height: 40.0,
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.email_rounded, color: Colors.black),
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(width: 1.0))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 8.0,
            child: ListTile(
              tileColor: Colors.greenAccent,
              title: Text('Tomar foto'),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.touch_app_rounded,
                    size: 18.0,
                    color: Colors.red,
                  ),
                  Text('Sonrie'),
                ],
              ),
              leading: Container(
                height: 40.0,
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.camera, color: Colors.black),
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(width: 1.0))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }

  _abrirWeb() async {
    const url = 'https://celaya.tecnm.mx/';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  llamadaTel() {}
  enviarSMS() async {
    const url = 'sms:4661088391';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  enviarEmail() async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: '17031484@itcelaya.edu.mx',
        query: 'subject=Saludos&body=Bienvenido c:');

    var email = params.toString();
    if (await canLaunch(email)) {
      await launch(email);
    }
  }

  tomarFoto() {}
}
