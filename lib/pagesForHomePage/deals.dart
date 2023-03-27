import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dealsWidgets/add_deal.dart';

class DealsPage extends StatefulWidget {
  final String searchText;
  const DealsPage(this.searchText, {super.key});

  @override
  State<DealsPage> createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("deals").snapshots(),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var list = snapshot.data.docs
              .where((x) => x['name']
                      .toLowerCase()
                      .contains(widget.searchText.toLowerCase())
                  ? true
                  : false)
              .toList();
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) =>
                generateListItem(context, list[index]),
          );
        }
      },
    );
  }

  Widget? generateListItem(context, docs) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          docs['name'],
        ),
        subtitle: Text(docs['description']),
        leading: Image.network(docs['image']),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(
            builder: (context) {
              var deal = Deal(docs['name'], docs['description'], docs['image'], docs.id);
              return AddDeal(deal, "Изменить/удалить", isEditing: true);
            },
          ));
        },
      ),
    );
  }
}

class Deal {
  String? id;
  String name;
  String description;
  String image;
  Deal(this.name, this.description, this.image, this.id);
}
