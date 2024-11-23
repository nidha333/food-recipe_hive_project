import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project_app/models/models.dart';
import 'package:hive_project_app/models/non_veg_model.dart';
import 'package:hive_project_app/models/usermodel.dart';
import 'package:hive_project_app/registerpage.dart';
import 'package:hive_project_app/splash.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();

  Hive.registerAdapter(VegFoodRecipeAdapter());
  Hive.registerAdapter(NonVegModelAdapter());
  Hive.registerAdapter(UsermodelAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.inderTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
