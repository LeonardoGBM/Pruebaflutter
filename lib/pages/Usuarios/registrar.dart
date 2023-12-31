import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bk/scr/navbar/drawer.dart';
import 'package:bk/scr/navbar/navbar.dart';

class AgregarUsuario extends StatefulWidget {
  @override
  _AgregarUsuarioState createState() => _AgregarUsuarioState();
}

class _AgregarUsuarioState extends State<AgregarUsuario> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController fechaNacimientoController = TextEditingController();

  Future<void> agregarUsuario() async {
    final url = Uri.parse('http://localhost:8081/api/usuario/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json', // Establece el tipo de contenido como JSON
      },
      body: json.encode({
        'nombre': nombreController.text,
        'correoElectronico': correoController.text,
        'contrasena': contrasenaController.text,
        'direccion': direccionController.text,
        'fechaNacimiento': fechaNacimientoController.text,
      }),
    );

    if (response.statusCode == 201) {
      // Usuario agregado exitosamente
      Navigator.popAndPushNamed(context, "/usuario");
    } else {
      // Error al agregar el usuario
      print('Error al agregar el usuario');
      Navigator.popAndPushNamed(context, "/usuario");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      backgroundColor: Colors.blue[600],
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            'Registro',
            style: TextStyle(
              fontFamily: 'cursiva',
              fontSize: 30.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 160.0,
            height: 15.0,
          ),
          SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: TextField(
              controller: nombreController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Nombre',
                suffixIcon: Icon(Icons.verified_user),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: TextField(
              controller: fechaNacimientoController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Fecha de nacimiento',
                suffixIcon: Icon(Icons.date_range),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: TextField(
              controller: direccionController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Dirección',
                suffixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: TextField(
              controller: correoController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Correo electrónico',
                suffixIcon: Icon(Icons.alternate_email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: TextField(
              controller: contrasenaController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Contraseña',
                suffixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: agregarUsuario,
                child: Text(
                  'Guardar',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Color.fromARGB(255, 15, 238, 201),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
