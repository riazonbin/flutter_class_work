import 'package:flutter/material.dart';
import 'package:flutter_class_work/pages/drawer.dart';
import 'package:flutter_class_work/pagesForHomePage/calendar.dart';
import 'package:flutter_class_work/pagesForHomePage/deals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  String titleOfPage = "Список дел";
  String searchText = "";
  var deals = dealsList;

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final listOfPages = [DealsPage(searchText), const CalendarPage()];
    var defaultAppBar = AppBar(
      actions: [
        IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
            icon: const Icon(Icons.exit_to_app)),
        IconButton(
            onPressed: () {
              setState(() {
                isSearching = true;
              });
            },
            icon: const Icon(Icons.search))
      ],
      title: Text(titleOfPage),
      centerTitle: true,
    );

    var searchAppBar = AppBar(
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                isSearching = false;
                searchController.clear();
              });
            },
            icon: const Icon(Icons.close)),
      ],
      title: TextField(
        controller: searchController,
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
      ),
      centerTitle: true,
    );

    return Scaffold(
      appBar: isSearching ? searchAppBar : defaultAppBar,
      drawer: const DrawerHomeMenu(),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.book), label: "Список дел"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "Календарь")
          ],
          currentIndex: currentPageIndex,
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
              if (currentPageIndex == 0) {
                titleOfPage = "Список дел";
              } else {
                titleOfPage = "Календарь";
              }
            });
          }),
      body: listOfPages[currentPageIndex],
    );
  }
}
