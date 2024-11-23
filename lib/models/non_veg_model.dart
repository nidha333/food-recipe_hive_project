import 'package:hive/hive.dart';
part 'non_veg_model.g.dart';

@HiveType(typeId: 2)
class NonVegModel {
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
  NonVegModel(
      {required this.itemName,
      required this.category,
      required this.addIngreadents,
      required this.amound,
      required this.image,
      required this.step});
}
