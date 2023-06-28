import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgregarAlmacen extends StatefulWidget {
  @override
  _AgregarAlmacenState createState() => _AgregarAlmacenState();
}

class _AgregarAlmacenState extends State<AgregarAlmacen> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController capacidadController = TextEditingController();

  Future<void> guardarAlmacen() async {
    final url = Uri.parse('http://localhost:8081/api/almacen/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nombre': nombreController.text,
        'direccion': direccionController.text,
        'capacidad': capacidadController.text,
      }),
    );

    if (response.statusCode == 201) {
      // Almacén guardado exitosamente
      Navigator.popAndPushNamed(context, "/almacen");
    } else {
      // Error al guardar el almacén
      print('Error al guardar el almacén');
      Navigator.popAndPushNamed(context, "/almacen");
    }
  }

  @override
  void dispose() {
    nombreController.dispose();
    direccionController.dispose();
    capacidadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Almacén'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Registro',
              style: TextStyle(
                fontSize: 30.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            TextField(
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
            SizedBox(height: 20.0),
            TextField(
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
            SizedBox(height: 20.0),
            TextField(
              controller: capacidadController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Capacidad',
                suffixIcon: Icon(Icons.add_box),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: guardarAlmacen,
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
      ),
    );
  }
}
