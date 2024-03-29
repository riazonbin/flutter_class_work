import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class_work/auth/service.dart';
import 'package:flutter_class_work/pages/drawer.dart';
import 'package:flutter_class_work/pagesForHomePage/calendar.dart';
import 'package:flutter_class_work/pagesForHomePage/deals.dart';

import 'pagesForHomePage/dealsWidgets/add_deal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  String titleOfPage = "Список дел";
  String searchText = "";

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final listOfPages = [DealsPage(searchText), const CalendarPage()];
    var defaultAppBar = AppBar(
      actions: [
        IconButton(
            onPressed: () async {
              await AuthServices().logOut();
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
                searchText = "";
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
        floatingActionButton: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: currentPageIndex == 0 ? 1 : 0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  var deal = Deal("", "", "", "");
                  return AddDeal(deal, "Добавить", isEditing: false);
                },
              ));
            },
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}
