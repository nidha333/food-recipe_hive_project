import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_project_app/bottomnavigationbar.dart';
import 'package:hive_project_app/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool? isBool = false;
  initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      checkLog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 123, 198),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Screenshot 2024-11-08 025521.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 500,
              ),
              const Text(
                'Help your path to health ',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                'goals with happiness',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Registerpage()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(220, 55),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Click Me',
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkLog() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isBool = pref.getBool('log');
    if (isBool == true) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const BottomnavigationbarPage()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const Registerpage()));
    }
  }
}
