import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

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
              const AuthTextFieldWidget(
                textForField: "Email",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const AuthTextFieldWidget(
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
                    const AlertDialog(
                      content: Text("Выполнен переход"),
                      backgroundColor: Colors.green,
                    );
                    Navigator.popAndPushNamed(context, '/home');
                  },
                  child: const Text("Sign in"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                child: const Text(
                  "Sign up?",
                  style: TextStyle(color: Colors.amber),
                ),
                onTap: () {},
              ),
              SizedBox(
                child: ElevatedButton(
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  onPressed: () {},
                  child: const Text("Test scrolling"),
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
  const AuthTextFieldWidget({super.key, required this.textForField});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        cursorColor: Colors.amber,
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
