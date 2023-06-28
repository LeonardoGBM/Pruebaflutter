import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Leonardo'),
            accountEmail: Text('Leonardo@.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/logo-sec.png'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/inventario');
            },
          ),
          ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Gestion de usuarios'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/usuario');
              },
            ),
            ListTile(
              leading: Icon(Icons.accessibility),
              title: Text('Gestion de roles'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/roles');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Gestion de productos'),
              onTap: () {
                Navigator.popAndPushNamed(context, "/productos");
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Gestion de categorias'),
              onTap: () {
                Navigator.popAndPushNamed(context, "/categoria");
              },
            ),
            ListTile(
              leading: Icon(Icons.groups),
              title: Text('Gestion de proveedores'),
              onTap: () => Navigator.popAndPushNamed(context, "/provedores"),
            ),
            ListTile(
              leading: Icon(Icons.store),
              title: Text('Gestion de almacen'),
              onTap: () => Navigator.popAndPushNamed(context, "/almacen"),
            ),
        ],
      ),
    );
  }
}
