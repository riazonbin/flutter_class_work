import 'package:flutter/material.dart';

class ScrollingPage extends StatelessWidget {
  const ScrollingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Скроллинг"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Card(
                            child: ListTile(
                          title: const Text("Горизонтальный"),
                          subtitle: Text("$index"),
                        )),
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Card(
                            child: ListTile(
                          title: const Text("Вертикальный"),
                          subtitle: Text("$index"),
                        )),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
