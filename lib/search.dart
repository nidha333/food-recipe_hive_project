import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_project_app/database/function.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const Gap(40),
          const ListTile(
            title: Text(
              'Search',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 232, 244, 254),
                border: InputBorder.none,
                hintText: 'Search...',
                suffixIcon: Icon(Icons.search),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ValueListenableBuilder(
              valueListenable: foodrecipeNotifier,
              builder: (context, value, child) {
                List filteredRecipes = value.where((recipe) {
                  return recipe.itemName!
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase()) ||
                      recipe.category!
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase());
                }).toList();

                if (filteredRecipes.isEmpty) {
                  return Center(
                    child: Text('No food details found'),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredRecipes.length,
                  itemBuilder: (context, index) {
                    final datas = filteredRecipes[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        color: const Color.fromARGB(255, 186, 224, 255),
                        elevation: 10,
                        child: ListTile(
                          title: Text(datas.itemName!),
                          subtitle: Text(datas.category!),
                          trailing: Text(
                            datas.amound!,
                            style: const TextStyle(fontSize: 15),
                          ),
                          leading: CircleAvatar(
                            radius: 40,
                            child: datas.image != null
                                ? Image.file(File(datas.image!))
                                : Image.asset('assets/veg3.jpeg'),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
