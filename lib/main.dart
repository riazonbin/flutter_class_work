import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class_work/pages/iphone_menu.dart';
import 'package:flutter_class_work/pages/scrolling.dart';
import 'auth_page.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/home':(context) => const HomePage(),
        '/scrolling':(context) => const ScrollingPage(),
        '/iphone_menu':(context) => const IphoneMenuPage()
        },
    );
  }
}
