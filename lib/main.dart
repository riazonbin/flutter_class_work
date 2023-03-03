import 'package:flutter/material.dart';
import 'auth_page.dart';
import 'home.dart';

void main() {
  runApp(const MyTheme());
}

class MyTheme extends StatelessWidget {
  const MyTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.amber,
          elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle(

            )
          )
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const AuthPage(),
        '/home':(context) => const HomePage()
        },
    );
  }
}
