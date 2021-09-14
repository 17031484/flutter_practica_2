import 'package:flutter/material.dart';
import 'package:practica2/src/utils/color_settings.dart';

class Opcion1Screen extends StatefulWidget {
  Opcion1Screen({Key? key}) : super(key: key);

  @override
  _Opcion1ScreenState createState() => _Opcion1ScreenState();
}

class _Opcion1ScreenState extends State<Opcion1Screen> {
  TextEditingController txtPropinaCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextFormField txtPropina = TextFormField(
      controller: txtPropinaCon,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: 'Ingrese la cantidad',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
    );
    ElevatedButton button = ElevatedButton(
      style: ElevatedButton.styleFrom(primary: ColorSettings.colorButton),
      onPressed: () {
        String textoBueno = '';
        //print((propina * .10));
        try {
          double total = double.parse(txtPropinaCon.text);
          double propina = total * .10;
          textoBueno = 'Total :$total \nPropina: $propina ';
          print(total.isNaN);
          if (total < 0) {
            textoBueno = 'Solo se aceptan numeros positivos';
          }
        } catch (Exception) {
          textoBueno = 'Datos erroneos';
        }

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: Colors.greenAccent,
                  title: Text('Total a pagar'),
                  content: Text(textoBueno),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancelar')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Aceptar'))
                  ],
                ));

        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Icon(Icons.login), Text('Calcular propina')],
      ),
    );
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/azul.jpg'))),
        ),
        Card(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                txtPropina,
                SizedBox(
                  height: 5,
                ),
                button
              ],
            ),
          ),
        ),
        Positioned(
          child: Image.asset(
            'assets/propina.png',
            width: 120,
          ),
          top: 120,
        ),
      ],
    );
  }
}
