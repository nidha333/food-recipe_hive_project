import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_project_app/models/models.dart';
import 'package:hive_project_app/models/usermodel.dart';

ValueNotifier<List<FoodRecipe>> foodrecipeNotifier = ValueNotifier([]);
ValueNotifier<List<Usermodel>> userModelNotifier = ValueNotifier([]);

var addingrediants = [];

Future addRecipe(FoodRecipe value) async {
  final foodDB = await Hive.openBox<FoodRecipe>('database');
  foodDB.add(value);
  getAllRecipe();
}

Future getAllRecipe() async {
  final foodDB = await Hive.openBox<FoodRecipe>('database');
  foodrecipeNotifier.value.clear();
  foodrecipeNotifier.value.addAll(foodDB.values);
  foodrecipeNotifier.notifyListeners();
}

Future deleteRecipe(int index) async {
  final foodDB = await Hive.openBox<FoodRecipe>('database');
  foodDB.deleteAt(index);
  getAllRecipe();
}

Future editRecipe(int index, FoodRecipe value) async {
  final foodDB = await Hive.openBox<FoodRecipe>('database');
  foodDB.putAt(index, value);
  getAllRecipe();
}

Future editUser(int index, Usermodel value) async {
  final userDB = await Hive.openBox<Usermodel>('userone');
  userDB.putAt(index, value);
  getAllUser();
}

Future adduser(Usermodel value) async {
  final userdb = await Hive.openBox<Usermodel>('userone');
  userdb.put('user', value);
  getAllUser();
}

Future<void> clear() async {
  final userdb = await Hive.openBox<FoodRecipe>('database');
  userdb.clear();
}

Future getAllUser() async {
  final userDB = await Hive.openBox<Usermodel>('userone');
  userModelNotifier.value.clear();
  userModelNotifier.value.addAll(userDB.values);
  userModelNotifier.notifyListeners();
}

Future<void> ingrdians(value) async {
  final userDB = await Hive.openBox<Usermodel>('userone');
  userDB.add(value);
}
