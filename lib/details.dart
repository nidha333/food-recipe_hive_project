import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Details extends StatelessWidget {
  String? name;
  String? catogary;
  String? image;
  String? amount;
  String? step;
  String? ingredients;
  Details(
      {super.key,
      required this.name,
      required this.catogary,
      required this.image,
      required this.amount,
      required this.ingredients,
      required this.step});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Gap(50),
          ListTile(
            title: Text(
              'Details',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Gap(60),
          Card(
              elevation: 10,
              child: image != null
                  ? Image.file(File(image!))
                  : Image.asset('assets/veg3.jpeg')),
          ListTile(
            title: Text(
              '$name',
              style: TextStyle(fontSize: 30),
            ),
            subtitle: Column(
              children: [
                Gap(20),
                Text(' Category : $catogary'),
                Text('ingredients: $ingredients'),
                Text('Amount : $amount'),
                Text('Step : $step'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
