import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practica2/src/database/db_helper_profile.dart';
import 'package:practica2/src/models/profile_model.dart';
import 'package:practica2/src/utils/color_settings.dart';

class AgregarPerfil extends StatefulWidget {
  AgregarPerfil({Key? key}) : super(key: key);

  @override
  _AgregarPerfilState createState() => _AgregarPerfilState();
}

class _AgregarPerfilState extends State<AgregarPerfil> {
  late Helper_Profile _databaseHelper;
  TextEditingController _controllerNombre = TextEditingController();
  TextEditingController _controllerApaterno = TextEditingController();
  TextEditingController _controllerAmaterno = TextEditingController();
  TextEditingController _controllerTel = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  File? imagen;

  Future agregarImagen(ImageSource src) async {
    try {
      final imagen = await ImagePicker().pickImage(source: src);
      if (imagen == null) return;

      final imagenPerm = await guardarImagen(imagen.path);
      setState(() {
        this.imagen = imagenPerm;
      });
    } on PlatformException catch (e) {
      print('Fallo al seleccionar imagen $e');
    }
  }

  Future<File> guardarImagen(String imagenPath) async {
    final directorio = await getApplicationDocumentsDirectory();
    final nombre = imagenPath;
    final imagen = File('${directorio.path}/$nombre');
    return File(imagenPath).copy(imagen.path);
  }

  @override
  // ignore: must_call_super
  void initState() {
    _databaseHelper = Helper_Profile();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _databaseHelper.getPerfil(1),
      builder: (BuildContext context, AsyncSnapshot<ProfileModel> snapshot) {
        if (snapshot.hasError) {
          //print("Error");
          return Center(
            child: Text('Ocurrio un error en la peticion'),
          );
        } else {
          if (snapshot.connectionState == ConnectionState.done) {
            //print("Success");
            _controllerNombre.text = snapshot.data!.nombre!;
            _controllerApaterno.text = snapshot.data!.a_paterno!;
            _controllerAmaterno.text = snapshot.data!.a_materno!;
            _controllerTel.text = snapshot.data!.tel!;
            _controllerEmail.text = snapshot.data!.email!;
            //fotosrc = snapshot.data!.foto!;
            imagen = File(snapshot.data!.foto!);
            return _perfil();
          } else {
            //print("nope");
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      },
    );
  }

  Widget _perfil() {
    //imagen == File(fotosrc!) ? imagen = File(fotosrc!) : null;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorSettings.colorPrimary,
        title: Text('Editar Perfil'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Wrap(alignment: WrapAlignment.center, children: <Widget>[
            ClipOval(
                child: Image.file(
              imagen!,
              width: 160,
              height: 160,
              fit: BoxFit.cover,
            )),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () => agregarImagen(ImageSource.camera),
                  child: Icon(Icons.camera),
                ),
                ElevatedButton(
                    onPressed: () => agregarImagen(ImageSource.gallery),
                    child: Icon(Icons.photo)),
              ],
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          _crearTextFieldNombre(),
          SizedBox(
            height: 10,
          ),
          _crearTextFieldApaterno(),
          SizedBox(
            height: 10,
          ),
          _crearTextFieldAmaterno(),
          SizedBox(
            height: 10,
          ),
          _crearTextFieldTel(),
          SizedBox(
            height: 10,
          ),
          _crearTextFieldEmail(),
          ElevatedButton(
            onPressed: () {
              ProfileModel perfil = ProfileModel(
                id: 1,
                nombre: _controllerNombre.text,
                a_paterno: _controllerApaterno.text,
                a_materno: _controllerAmaterno.text,
                tel: _controllerTel.text,
                email: _controllerEmail.text,
                foto: imagen!.path,
              );
            },
            child: Text('Guardar Perfil'),
          )
        ],
      ),
    );
  }

  Widget _crearTextFieldNombre() {
    return TextField(
      controller: _controllerNombre,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: 'Titulo',
          errorText: 'Este campo es obligatorio'),
      onChanged: (value) {},
    );
  }

  Widget _crearTextFieldApaterno() {
    return TextField(
      controller: _controllerApaterno,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: 'Titulo',
          errorText: 'Este campo es obligatorio'),
      onChanged: (value) {},
    );
  }

  Widget _crearTextFieldAmaterno() {
    return TextField(
      controller: _controllerAmaterno,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: 'Titulo',
          errorText: 'Este campo es obligatorio'),
      onChanged: (value) {},
    );
  }

  Widget _crearTextFieldTel() {
    return TextField(
      controller: _controllerTel,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: 'Titulo',
          errorText: 'Este campo es obligatorio'),
      onChanged: (value) {},
    );
  }

  Widget _crearTextFieldEmail() {
    return TextField(
      controller: _controllerEmail,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: 'Titulo',
          errorText: 'Este campo es obligatorio'),
      onChanged: (value) {},
    );
  }
}
