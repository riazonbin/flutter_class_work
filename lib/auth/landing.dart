import 'package:flutter/material.dart';
import 'package:flutter_class_work/auth/model.dart';
import 'package:flutter_class_work/auth_page.dart';
import 'package:flutter_class_work/home.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel? model = Provider.of<UserModel?>(context);
    final bool check = model != null;
    return check ? const HomePage() : const AuthPage();
  }
}