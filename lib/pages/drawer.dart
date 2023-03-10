import 'package:flutter/material.dart';

class DrawerHomeMenu extends StatelessWidget {
  const DrawerHomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const catUrl =
        'https://i.mycdn.me/i?r=AzEPZsRbOZEKgBhR0XGMT1RkjL46s7_3ICJVs2fH4uuqCaaKTM5SRkZCeTgDn6uOyic';
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: const Text("Аккаунт"),
              accountEmail: const Text("Почта"),
              otherAccountsPictures: [IconButton(onPressed:() {
              }, icon: Icon(Icons.exit_to_app))],
              currentAccountPicture:
                  const CircleAvatar(backgroundImage: NetworkImage(catUrl))),
          ListTile(
            title: const Text("Настройки"),
            trailing: const Icon(Icons.arrow_right),
            leading: const Icon(Icons.settings),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Магазин"),
            trailing: const Icon(Icons.arrow_right),
            leading: const Icon(Icons.shop),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Помощь"),
            trailing: const Icon(Icons.arrow_right),
            leading: const Icon(Icons.help),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
