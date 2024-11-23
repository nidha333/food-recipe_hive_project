import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:hive_project_app/bottomnavigationbar.dart';
import 'package:hive_project_app/database/function.dart';

import 'package:hive_project_app/models/models.dart';
import 'package:image_picker/image_picker.dart';

class Addrecipy extends StatefulWidget {
  String? one;
  String? two;
  String? three;
  String? four;
  String? five;
  Addrecipy({
    super.key,
    this.one,
    this.two,
    this.three,
    this.four,
    this.five,
  });

  @override
  State<Addrecipy> createState() => _AddrecipyState();
}

class _AddrecipyState extends State<Addrecipy> {
  File? _image;

  final nameController = TextEditingController();

  final categoryController = TextEditingController();

  final totalAmountController = TextEditingController();

  final stepController = TextEditingController();
  final ingrediantsController = TextEditingController();

  String? selectedCategory;
  String? catogary;

  final List<String> categories = [
    'Veg',
    'Non-Veg',
  ];
  List<String> ingredients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(50),
            ListTile(
              title: Text(
                'Add Recipe',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Gap(30),
            Center(
              child: GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: _image != null
                        ? Image.file(_image!)
                        : Image.asset(
                            'assets/Screenshot 2024-11-13 012901.png'),
                  ),
                ),
              ),
            ),
            Gap(30),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 232, 244, 254),
                  border: InputBorder.none,
                  hintText: 'item name',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                ),
              ),
            ),
            Gap(5),
            Padding(
              padding: const EdgeInsets.all(15),
              child: DropdownButtonFormField<String>(
                value: selectedCategory,
                hint: Text("Select Category"),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 232, 244, 254),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue;
                  });
                },
                items: categories.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        minimumSize: Size(150, 50),
                        backgroundColor:
                            const Color.fromARGB(255, 220, 239, 255)),
                    onPressed: () {
                      _showIngredientDialog();
                    },
                    child: Text("add ingredients")),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: totalAmountController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 232, 244, 254),
                        border: InputBorder.none,
                        hintText: 'Total amound',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(5),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: stepController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 232, 244, 254),
                  border: InputBorder.none,
                  hintText: 'Making Step',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                ),
              ),
            ),
            Gap(20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50), backgroundColor: Colors.blue),
                onPressed: () {
                  addBtn(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                )),
            Gap(50)
          ],
        ),
      ),
    );
  }

  void _showIngredientDialog() {
    TextEditingController ingredientController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Ingredient'),
          content: TextFormField(
            controller: ingredientController,
            decoration: InputDecoration(
              hintText: 'Enter ingredient',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                String ingredient = ingredientController.text.trim();
                if (ingredient.isNotEmpty) {
                  setState(() {
                    ingredients.add(ingredient);
                  });
                }
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void addBtn(BuildContext context) {
    final name = nameController.text.trim();
    final category = selectedCategory;
    final amount = totalAmountController.text.trim();
    final step = stepController.text.trim();
    final ingrediants = ingrediantsController.text.trim();

    if (name.isEmpty || category == null || amount.isEmpty || step.isEmpty) {
      return;
    } else {
      final value = VegFoodRecipe(
          image: _image?.path ?? '',
          itemName: name,
          category: category,
          amound: amount,
          addIngreadents: ingrediants,
          step: step);
      addRecipe(value);
      print("data added");

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BottomnavigationbarPage()));
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
}
