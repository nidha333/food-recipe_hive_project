import 'package:hive/hive.dart';
part 'models.g.dart';

@HiveType(typeId: 0)
class FoodRecipe {
  @HiveField(0)
  String? itemName;
  @HiveField(1)
  String? category;
  @HiveField(2)
  String? addIngreadents;
  @HiveField(3)
  String? amound;
  @HiveField(4)
  String? step;
  @HiveField(5)
  String? image;
  FoodRecipe(
      {required this.itemName,
      required this.category,
      required this.addIngreadents,
      required this.amound,
      required this.image,
      required this.step});
}
