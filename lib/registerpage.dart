import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_project_app/bottomnavigationbar.dart';

import 'package:hive_project_app/signuppage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final nameController = TextEditingController();

  final passwordController = TextEditingController();

  var obscuree = false;
  IconData giveIcon = Icons.visibility;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imggggg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(190),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              const Gap(60),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 232, 244, 254),
                    border: InputBorder.none,
                    hintText: 'username',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                  ),
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: 500,
                  height: 100,
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscuree = !obscuree;
                              if (obscuree == true) {
                                giveIcon = Icons.visibility_off;
                              } else {
                                giveIcon = Icons.visibility;
                              }
                            });
                          },
                          icon: Icon(giveIcon)),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 232, 244, 254),
                      border: InputBorder.none,
                      hintText: 'password',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 17),
                    ),
                    obscureText: obscuree,
                  ),
                ),
              ),
              const Gap(70),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    registerPage();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 58, 159, 241),
                    minimumSize: const Size(250, 60),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              const Gap(10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signuppage()));
                },
                child: const Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        TextSpan(
                          text: "Sign up!",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registerPage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? saveName = pref.getString('username');
    String? savePassword = pref.getString('password');
    final name = nameController.text.trim();
    final password = passwordController.text.trim();
    if (name.isNotEmpty && password.isNotEmpty) {
      if (name == saveName && password == savePassword) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomnavigationbarPage()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('username and password is incorrect')));
    }
  }
}
