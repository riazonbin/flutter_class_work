import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IphoneMenuPage extends StatelessWidget {
  const IphoneMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return Scaffold(
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.80,
            child: const ListMaker(numberOfItems: 22),
          ),
        ),
        bottomNavigationBar: SizedBox(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Card(
              color: Colors.grey.withOpacity(0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: const ListMaker(numberOfItems: 4),
            )));
  }
}

class ListMaker extends StatelessWidget {
  final int numberOfItems;

  const ListMaker({super.key, required this.numberOfItems});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: numberOfItems,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.amber,
            child: IconButton(
              icon: const Icon(Icons.apple),
              onPressed: () {},
            ));
      },
    );
  }
}
