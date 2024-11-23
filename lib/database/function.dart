// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_project_app/models/models.dart';
import 'package:hive_project_app/models/non_veg_model.dart';
import 'package:hive_project_app/models/usermodel.dart';

ValueNotifier<List<VegFoodRecipe>> foodrecipeNotifier = ValueNotifier([]);
ValueNotifier<List<Usermodel>> userModelNotifier = ValueNotifier([]);
ValueNotifier<List<NonVegModel>> nonVegListNotifier = ValueNotifier([]);
var addingrediants = [];

Future addRecipe(VegFoodRecipe value) async {
  final foodDB = await Hive.openBox<VegFoodRecipe>('database');
  foodDB.add(value);
  getAllRecipe();
}

Future getAllRecipe() async {
  final foodDB = await Hive.openBox<VegFoodRecipe>('database');
  foodrecipeNotifier.value.clear();
  foodrecipeNotifier.value.addAll(foodDB.values);
  foodrecipeNotifier.notifyListeners();
}

Future deleteRecipe(int index) async {
  final foodDB = await Hive.openBox<VegFoodRecipe>('database');
  foodDB.deleteAt(index);
  getAllRecipe();
}

Future editRecipe(int index, VegFoodRecipe value) async {
  final foodDB = await Hive.openBox<VegFoodRecipe>('database');
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
  final userdb = await Hive.openBox<VegFoodRecipe>('database');
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

Future addNonVegRecipe(NonVegModel value) async {
  final foodDB = await Hive.openBox<NonVegModel>('database');
  foodDB.add(value);
  getAllRecipe();
}

Future getAllNonVegRecipe() async {
  final foodDB = await Hive.openBox<NonVegModel>('database');
  nonVegListNotifier.value.clear();
  nonVegListNotifier.value.addAll(foodDB.values);
  nonVegListNotifier.notifyListeners();
}

Future deleteNonVegRecipe(int index) async {
  final foodDB = await Hive.openBox<NonVegModel>('database');
  foodDB.deleteAt(index);
  getAllNonVegRecipe();
}

Future editNonVegRecipe(int index, NonVegModel value) async {
  final foodDB = await Hive.openBox<NonVegModel>('database');
  foodDB.putAt(index, value);
  getAllRecipe();
}
