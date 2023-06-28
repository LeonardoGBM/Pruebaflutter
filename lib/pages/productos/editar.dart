import 'package:flutter/material.dart';
import 'package:bk/scr/navbar/drawer.dart';
import 'package:bk/scr/navbar/navbar.dart';
import 'package:decimal/decimal.dart';

class EditProductos extends StatefulWidget {
  @override
  _EditProductosState createState() => _EditProductosState();
}

class _EditProductosState extends State<EditProductos> {
  Decimal precioUnitario = Decimal.zero;
  int cantidad = 0;
  int stockMinimo = 0;

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
            'Editar productos',
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
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Nombre',
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
              onChanged: (value) {
                setState(() {
                  precioUnitario = Decimal.tryParse(value) ?? Decimal.zero;
                });
              },
              decoration: InputDecoration(
                hintText: 'Precio unitario',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
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
              onChanged: (value) {
                setState(() {
                  cantidad = int.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cantidad',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.number,
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
              onChanged: (value) {
                setState(() {
                  stockMinimo = int.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(
                hintText: 'Stock mínimo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Utiliza los valores de precioUnitario, cantidad y stockMinimo según sea necesario
                  Navigator.popAndPushNamed(context, "/productos");
                },
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
