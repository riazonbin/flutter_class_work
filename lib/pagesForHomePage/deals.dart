import 'package:flutter/material.dart';

class DealsPage extends StatefulWidget {
  final String searchText;
  const DealsPage(this.searchText, {super.key});

  @override
  State<DealsPage> createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {
  List<Deal> currentDeals = List.from(dealsList);

  @override
  Widget build(BuildContext context) {
    currentDeals = dealsList
        .where((element) => element.title.contains(widget.searchText))
        .toList();
    return ListView.builder(
        itemBuilder: generateListItem, itemCount: currentDeals.length);
  }

  Widget? generateListItem(context, index) {
    var deal = currentDeals[index];
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: const Color.fromARGB(255, 166, 181, 189),
        title: Text(deal.title),
        subtitle: Text(deal.description),
        leading: Text(deal.id.toString()),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {},
      ),
    );
  }
}

class Deal {
  int id;
  String title;
  String description;
  Deal({required this.id, required this.title, required this.description});
}

List<Deal> dealsList = [
  Deal(
    id: 1,
    title: 'Сходить в магазин',
    description: 'Купить молоко,хлеб,сыр',
  ),
  Deal(
    id: 2,
    title: 'Flutter',
    description: 'Прописать Flutter upgrade',
  ),
  Deal(
    id: 3,
    title: 'Поиграть Dota 2',
    description: 'Выиграть в турнире',
  ),
];
