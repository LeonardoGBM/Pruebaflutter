import 'package:flutter/material.dart';
import 'package:bk/scr/navbar/drawer.dart';
import 'package:bk/scr/navbar/navbar.dart';

class EditCategoria extends StatefulWidget {
  @override
  _EditCategoriaState createState() => _EditCategoriaState();
}

class _EditCategoriaState extends State<EditCategoria> {
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
            'Editar',
            style: TextStyle(
              fontFamily: 'cursiva',
              fontSize: 30.0,
            ),
            textAlign: TextAlign.center, // Centra el texto horizontalmente
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
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Descripcion',
                suffixIcon: Icon(Icons.assignment),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Centra el botón horizontalmente
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/categoria");
                },
                child: Text(
                  'Guardar cambios',
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