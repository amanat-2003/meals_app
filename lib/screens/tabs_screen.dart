import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/favourites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        // initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Meals"),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: "Categories",
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: "Favourites",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CategoriesScreen(),
              FavouritesScreen(),
            ],
          ),
        ));
  }
}
