import 'package:hive/hive.dart';
part 'usermodel.g.dart';

@HiveType(typeId: 1)
class Usermodel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? phonenumber;
  @HiveField(4)
  String? image;

  Usermodel(
      {required this.name,
      required this.email,
      required this.password,
      this.image,
      this.phonenumber});
}
