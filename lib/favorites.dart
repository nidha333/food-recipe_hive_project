import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_project_app/database/function.dart';
import 'package:hive_project_app/details.dart';

class Favorites extends StatefulWidget {
  final List<int> favoriteIndices;

  const Favorites({super.key, required this.favoriteIndices});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  Map<int, bool> moodSelected = {};
  Map<int, bool> likeSelected = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Favorites',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ValueListenableBuilder(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: widget.favoriteIndices.length,
              itemBuilder: (context, index) {
                final recipe = value[widget.favoriteIndices[index]];

                final recipeImage = recipe.image != null
                    ? Image.file(
                        File(recipe.image!),
                        width: 320,
                        height: 300,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/Screenshot_2024-11-12_050329-removebg-preview.png',
                        width: 320,
                        height: 300,
                        fit: BoxFit.cover,
                      );

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Details(
                          amount: recipe.amound,
                          step: recipe.step,
                          name: recipe.itemName,
                          ingredients: recipe.addIngreadents,
                          catogary: recipe.category,
                          image: recipe.image,
                        ),
                      ));
                    },
                    child: Card(
                      elevation: 10,
                      color: Color.fromARGB(255, 217, 238, 255),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Gap(20),
                          recipeImage,
                          Gap(20),
                          ListTile(
                            title: Text(
                              " Name : ${recipe.itemName!}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Category : ${recipe.category!}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  "Amount : ${recipe.amound!}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      moodSelected[index] =
                                          !(moodSelected[index] ?? false);
                                    });

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          moodSelected[index]!
                                              ? 'Mood selected for ${recipe.itemName!}!'
                                              : 'Mood deselected for ${recipe.itemName!}!',
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.sentiment_satisfied_alt,
                                    color: moodSelected[index] == true
                                        ? Colors.green
                                        : Colors.black,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      likeSelected[index] =
                                          !(likeSelected[index] ?? false);
                                    });

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          likeSelected[index]!
                                              ? 'You liked ${recipe.itemName!}!'
                                              : 'You removed the like from ${recipe.itemName!}!',
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.thumb_up_alt,
                                    color: likeSelected[index] == true
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          valueListenable: foodrecipeNotifier,
        ),
      ),
    );
  }
}
