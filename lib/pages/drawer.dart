import 'package:flutter/material.dart';

class DrawerHomeMenu extends StatelessWidget {
  const DrawerHomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:  const [
          UserAccountsDrawerHeader(
              accountName: Text("Аккаунт"), accountEmail: Text("Почта"),
              currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage('https://i.mycdn.me/i?r=AzEPZsRbOZEKgBhR0XGMT1RkjL46s7_3ICJVs2fH4uuqCaaKTM5SRkZCeTgDn6uOyic')),)
        ],
      ),
    );
  }
}
