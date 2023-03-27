import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class_work/pagesForHomePage/deals.dart';

class AddDeal extends StatefulWidget {
  bool? isEditing;
  Deal deal;
  String? title;
  final String defaultImage =
      "https://firebasestorage.googleapis.com/v0/b/monkeymobile-38bef.appspot.com/o/b9086f52-4b5c-462d-b19b-99cd44fbb28b.png?alt=media&token=e4c11372-00a8-493d-a55a-dd9771a76e93";

  AddDeal(this.deal, this.title, {super.key, this.isEditing});

  @override
  State<AddDeal> createState() => _AddDealState();
}

class _AddDealState extends State<AddDeal> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.deal.name != "" ||
        widget.deal.description != "" ||
        widget.deal.image != "") {
      nameController.text = widget.deal.name.toString();
      descriptionController.text = widget.deal.description.toString();
      imageController.text = widget.deal.image.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
              child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Card(
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(label: Text("Название")),
            ),
          ),
          Card(
            child: TextField(
              controller: descriptionController,
              decoration: const InputDecoration(label: Text("Описание")),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          if (widget.isEditing == false) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ElevatedButton(
                    child: const Row(
                      children: [Text("Добавить"), Icon(Icons.add)],
                    ),
                    onPressed: () async {
                      CollectionReference deals =
                          FirebaseFirestore.instance.collection("deals");
                      await deals.add({
                        'name': nameController.text,
                        'description': descriptionController.text,
                        'image': widget.defaultImage
                      });
                      nameController.clear();
                      descriptionController.clear();
                      imageController.clear();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ElevatedButton(
                    child: const Row(
                      children: [Text("Изменить"), Icon(Icons.refresh)],
                    ),
                    onPressed: () async {
                      CollectionReference deals =
                          FirebaseFirestore.instance.collection("deals");
                      await deals.doc(widget.deal.id).update({
                        'name': nameController.text,
                        'description': descriptionController.text,
                        'image': widget.defaultImage
                      });
                      nameController.clear();
                      descriptionController.clear();
                      imageController.clear();
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ElevatedButton(
                    child: const Row(
                      children: [Text("Удалить"), Icon(Icons.delete)],
                    ),
                    onPressed: () async {
                      CollectionReference deals =
                          FirebaseFirestore.instance.collection("deals");
                      await deals.doc(widget.deal.id).delete();
                      nameController.clear();
                      descriptionController.clear();
                      imageController.clear();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ]
        ]),
      ))),
    );
  }
}
