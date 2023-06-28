import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgregarCategoria extends StatefulWidget {
  @override
  _AgregarCategoriaState createState() => _AgregarCategoriaState();
}

class _AgregarCategoriaState extends State<AgregarCategoria> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();

  Future<void> guardarCategoria() async {
    final url = Uri.parse('http://localhost:8081/api/categorias/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nombre': nombreController.text,
        'descripcion': descripcionController.text,
      }),
    );

    if (response.statusCode == 201) {
      // Categoría guardada exitosamente
      Navigator.popAndPushNamed(context, "/categoria");
    } else {
      // Error al guardar la categoría
      print('Error al guardar la categoría');
        Navigator.popAndPushNamed(context, "/categoria");
    }
  }

  @override
  void dispose() {
    nombreController.dispose();
    descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Categoría'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Registrar una Categoría',
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
              controller: descripcionController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Descripción',
                suffixIcon: Icon(Icons.assignment),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: guardarCategoria,
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
