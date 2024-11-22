// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// class Favorites extends StatefulWidget {
//   const Favorites({super.key});

//   @override
//   State<Favorites> createState() => _FavoritesState();
// }

// class _FavoritesState extends State<Favorites> {
//   final List<String> fav = [];

//   void favorite(String favorite) {
//     final isExist = fav.contains(favorite);
//     if (isExist) {
//       fav.remove(favorite);
//     } else {
//       fav.add(favorite);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//             child: Column(children: [
//       Gap(50),
//       ListTile(
//         title: Text(
//           'Favorites',
//           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//       ),
//       Gap(30),

//       //     Padding(
//       //       padding: const EdgeInsets.all(20),
//       //       child: Card(
//       //         color: const Color.fromARGB(255, 233, 245, 255),
//       //         elevation: 10,
//       //         child: Column(
//       //           mainAxisAlignment: MainAxisAlignment.center,
//       //           mainAxisSize: MainAxisSize.min,
//       //           children: [
//       //             Image.asset('assets/veg1.jpg'),
//       //             Gap(20),
//       //             ListTile(
//       //               title: Text(' Veg Salad'),
//       //               subtitle: Text('  veg'),
//       //               trailing: IconButton(
//       //                   onPressed: () {},
//       //                   icon: Icon(Icons.thumb_up_alt_outlined)),
//       //             )
//       //           ],
//       //         ),
//       //       ),
//       //     ),
//       //     Gap(20),
//       //     Padding(
//       //       padding: const EdgeInsets.all(20),
//       //       child: Card(
//       //         color: const Color.fromARGB(255, 233, 245, 255),
//       //         elevation: 10,
//       //         child: Column(
//       //           mainAxisAlignment: MainAxisAlignment.center,
//       //           mainAxisSize: MainAxisSize.min,
//       //           children: [
//       //             Gap(20),
//       //             Image.asset('assets/non veg4.jpeg'),
//       //             Gap(20),
//       //             ListTile(
//       //               title: Text('Cake'),
//       //               subtitle: Text('Non - veg'),
//       //               trailing: IconButton(
//       //                   onPressed: () {},
//       //                   icon: Icon(Icons.thumb_up_alt_outlined)),
//       //             )
//       //           ],
//       //         ),
//       //       ),
//       //     ),
//       //     Gap(20),
//       //     Padding(
//       //       padding: const EdgeInsets.all(20),
//       //       child: Card(
//       //         color: const Color.fromARGB(255, 233, 245, 255),
//       //         elevation: 10,
//       //         child: Column(
//       //           mainAxisAlignment: MainAxisAlignment.center,
//       //           mainAxisSize: MainAxisSize.min,
//       //           children: [
//       //             Gap(20),
//       //             Image.asset('assets/veg4.jpg'),
//       //             Gap(20),
//       //             ListTile(
//       //               title: Text('Apple jam'),
//       //               subtitle: Text('  veg'),
//       //               trailing: IconButton(
//       //                   onPressed: () {},
//       //                   icon: Icon(Icons.thumb_up_alt_outlined)),
//       //             )
//       //           ],
//       //         ),
//       //       ),
//       //     )
//       //   ],
//       // ),
//     ])));
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_project_app/details.dart';
import 'package:hive_project_app/models/models.dart'; // Import your Recipe model if required

class Favorites extends StatelessWidget {
  final List<FoodRecipe> favoriteRecipes;

  const Favorites({super.key, required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        backgroundColor: Color.fromARGB(255, 98, 184, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: favoriteRecipes.length,
          itemBuilder: (context, index) {
            final recipe = favoriteRecipes[index];
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
                          )));
                },
                child: Card(
                  color: Color.fromARGB(255, 217, 238, 255),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Gap(20),
                      recipe.image != null
                          ? Image.file(File(recipe.image!))
                          : Image.asset(
                              'assets/Screenshot_2024-11-12_050329-removebg-preview.png'),
                      Gap(20),
                      ListTile(
                        title: Text(
                          recipe.itemName!,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.category!,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              recipe.amound!,
                              style: const TextStyle(fontSize: 18),
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
        ),
      ),
    );
  }
}
