import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hive_project_app/database/function.dart';
import 'package:hive_project_app/details.dart';
import 'package:hive_project_app/gallery.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    getAllRecipe();

    final List<String> imgList = [
      'assets/Screenshot 2024-11-09 021508.png',
      'assets/Screenshot 2024-11-09 021733.png',
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Gap(20),
              ListTile(
                title: const Text('Hello,'),
                subtitle: const Text(
                  'Nidha Thesni',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GalleryPage()));
                    },
                    icon: const Icon(
                      Icons.image,
                      size: 30,
                      color: Color.fromARGB(255, 98, 184, 255),
                    )),
              ),
              const Gap(20),
              const ListTile(
                title: Text(
                  'Featured',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(20),
              CarouselSlider.builder(
                itemCount: imgList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imgList[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
              ),
              const Gap(20),
              const ListTile(
                title: Text(
                  'Category',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(10),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor:
                                const Color.fromARGB(255, 185, 222, 252),
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedCategory = 'All';
                            });
                          },
                          child: const Text('All Recipe'),
                        ),
                        const Gap(30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor:
                                const Color.fromARGB(255, 240, 248, 254),
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedCategory = 'Veg';
                            });
                          },
                          child: const Text('Veg'),
                        ),
                        const Gap(30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor:
                                const Color.fromARGB(255, 240, 248, 254),
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedCategory = 'Non-Veg';
                            });
                          },
                          child: const Text('Non-Veg'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 350,
                child: ValueListenableBuilder(
                  valueListenable: foodrecipeNotifier,
                  builder: (context, value, child) {
                    if (value.isEmpty) {
                      return Center(
                          child: Image.asset(
                        'assets/veg1.jpg',
                      ));
                    }

                    List filteredRecipes = selectedCategory == 'All'
                        ? value
                        : value.where((recipe) {
                            return recipe.category == selectedCategory;
                          }).toList();

                    return ListView.builder(
                      itemCount: filteredRecipes.length,
                      itemBuilder: (context, index) {
                        final datas = value[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Details(
                                        amount: datas.amound,
                                        step: datas.step,
                                        name: datas.itemName,
                                        ingredients: datas.addIngreadents,
                                        catogary: datas.category,
                                        image: datas.image,
                                      )));
                            },
                            child: Card(
                              color: const Color.fromARGB(255, 217, 238, 255),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Gap(40),
                                  Container(
                                    child: datas.image != null
                                        ? Image.file(File(datas.image!))
                                        : Image.asset(
                                            'assets/Screenshot_2024-11-12_050329-removebg-preview.png'),
                                    width: 300,
                                    height: 300,
                                    color: Colors.white,
                                  ),
                                  Gap(20),
                                  ListTile(
                                    title: Text(
                                      datas.itemName!,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      children: [
                                        Text(
                                          datas.category!,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          datas.amound!,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            deleteRecipe(index);
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons
                                                    .favorite_border_outlined)))
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
