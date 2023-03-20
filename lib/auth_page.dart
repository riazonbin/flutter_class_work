import 'package:flutter/material.dart';
import 'package:flutter_class_work/auth/service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthServices _service = AuthServices();
  bool isRegister = false;

  Future signIn() async {
    _service.signIn(_emailController.text, _passwordController.text);
  }

  Future signUp() async {
    _service.register(_emailController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "MonkeyApp",
                    style: TextStyle(color: Colors.amber, fontSize: 32),
                  ),
                  Image.asset("images/monkey.png")
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              AuthTextFieldWidget(
                _emailController,
                textForField: "Email",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              AuthTextFieldWidget(
                _passwordController,
                textForField: "Password",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  onPressed: () {
                    isRegister ? signUp() : signIn();
                  },
                  child: Text(isRegister ? "Sign up" : "Sign in"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                child: Text(
                  isRegister ? "Sign in?" : "Sign up?",
                  style: const TextStyle(color: Colors.amber),
                ),
                onTap: () {
                  setState(() {
                    isRegister = !isRegister;
                  });
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                child: ElevatedButton(
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  onPressed: () => Navigator.pushNamed(context, '/scrolling'),
                  child: const Text("Test scrolling"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                child: ElevatedButton(
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  onPressed: () => Navigator.pushNamed(context, '/iphone_menu'),
                  child: const Text("Test iphone menu"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthTextFieldWidget extends StatelessWidget {
  final String textForField;
  final TextEditingController? controller;
  const AuthTextFieldWidget(this.controller,
      {super.key, required this.textForField});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        cursorColor: Colors.amber,
        controller: controller,
        decoration: InputDecoration(
            label: Text(textForField),
            labelStyle: const TextStyle(color: Colors.amber),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.amber)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.amber)),
            prefixIcon: const Icon(
              Icons.email,
              color: Colors.lime,
            )),
      ),
    );
  }
}
