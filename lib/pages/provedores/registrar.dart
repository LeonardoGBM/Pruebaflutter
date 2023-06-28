import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgregarProveedores extends StatefulWidget {
  @override
  _AgregarProveedoresState createState() => _AgregarProveedoresState();
}

class _AgregarProveedoresState extends State<AgregarProveedores> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController direccionController = TextEditingController();

  Future<void> guardarProveedor() async {
    final url = Uri.parse('http://localhost:8081/api/proveedor/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nombre': nombreController.text,
        'direccion': direccionController.text,
      }),
    );

    if (response.statusCode == 201) {
      // Proveedor guardado exitosamente
      Navigator.popAndPushNamed(context, "/provedores");
    } else {
      // Error al guardar el proveedor
      print('Error al guardar el proveedor');
      Navigator.popAndPushNamed(context, "/provedores");
    }
  }

  @override
  void dispose() {
    nombreController.dispose();
    direccionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Proveedor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Registro de Proveedores',
              style: TextStyle(
                fontSize: 30.0,
              ),
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
            ElevatedButton(
              onPressed: guardarProveedor,
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
