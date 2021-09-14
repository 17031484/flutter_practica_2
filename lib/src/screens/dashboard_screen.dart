import 'package:flutter/material.dart';
import 'package:practica2/src/utils/color_settings.dart';

class dashboard_screen extends StatelessWidget {
  const dashboard_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
        backgroundColor: ColorSettings.colorPrimary,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Samuel Contreras Mendoza'),
              accountEmail: Text('17031484@itcelaya.edu.mx'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/bb4acb12-8b93-41cd-ac2a-e1d8ece18a74/de6vi7d-2ead6fb3-bf0f-4549-bf26-54c8a58c7c23.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2JiNGFjYjEyLThiOTMtNDFjZC1hYzJhLWUxZDhlY2UxOGE3NFwvZGU2dmk3ZC0yZWFkNmZiMy1iZjBmLTQ1NDktYmYyNi01NGM4YTU4YzdjMjMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.-lH-yRwP_sERB-g527qbTxK3yVoML9i6q-aQklsrESU'),
              ),
              decoration: BoxDecoration(color: ColorSettings.colorPrimary),
            ),
            ListTile(
              title: Text('Practica 1'),
              subtitle: Text('Calcular propina'),
              leading: Icon(Icons.monetization_on),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/opc1');
              },
            ),
            ListTile(
              title: Text('Intenciones'),
              subtitle: Text('Intenciones implicitas'),
              leading: Icon(Icons.phone_android),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/intenciones');
              },
            )
          ],
        ),
      ),
    );
  }
}
