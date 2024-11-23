import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_project_app/addrecipy.dart';
import 'package:hive_project_app/favorites.dart';
// import 'package:hive_project_app/gallery.dart';
import 'package:hive_project_app/homepage.dart';
import 'package:hive_project_app/models/models.dart';
import 'package:hive_project_app/models/non_veg_model.dart';
import 'package:hive_project_app/profiledetails.dart';

import 'package:hive_project_app/search.dart';

class BottomnavigationbarPage extends StatefulWidget {
  const BottomnavigationbarPage({
    super.key,
  });

  @override
  State<BottomnavigationbarPage> createState() =>
      _BottomnavigationbarPageState();
}

final pages = [
  Homepage(),
  SearchPage(),
  Addrecipy(),
  // Favorites(
  //   favoriteRecipes: [],
  // ),
  Profiledetails()
];

class _BottomnavigationbarPageState extends State<BottomnavigationbarPage> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[page],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.transparent,
        color: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        items: <Widget>[
          Image.asset(
            'assets/Screenshot_2024-11-12_050329-removebg-preview.png',
            width: 70,
            height: 70,
          ),
          Image.asset(
            'assets/Screenshot_2024-11-12_044803-removebg-preview.png',
            width: 40,
            height: 40,
          ),
          Image.asset(
            'assets/Screenshot_2024-11-12_050824-removebg-preview.png',
            width: 70,
            height: 70,
          ),
          // Image.asset(
          //   'assets/Screenshot_2024-11-16_025421-removebg-preview.png',
          //   width: 70,
          //   height: 70,
          // ),
          Image.asset(
            'assets/Screenshot_2024-11-12_053113-removebg-preview.png',
            width: 70,
            height: 70,
          )
        ],
        onTap: (value) {
          setState(() {
            page = value;
          });
        },
      ),
    );
  }
}
