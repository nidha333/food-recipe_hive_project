import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_project_app/bottomnavigationbar.dart';
import 'package:hive_project_app/database/function.dart';
import 'package:hive_project_app/models/usermodel.dart';
import 'package:hive_project_app/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var obscuree = false;
  IconData giveIcon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const Gap(180),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              const Gap(50),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 232, 244, 254),
                    border: InputBorder.none,
                    hintText: 'Username',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                  ),
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 232, 244, 254),
                    border: InputBorder.none,
                    hintText: 'Email',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                  ),
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscuree = !obscuree;
                          giveIcon = obscuree
                              ? Icons.visibility_off
                              : Icons.visibility;
                        });
                      },
                      icon: Icon(giveIcon),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 232, 244, 254),
                    border: InputBorder.none,
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 17),
                  ),
                  obscureText: obscuree,
                ),
              ),
              const Gap(60),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    signUpPage();
                    print("object");
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
                    'Register',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
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

  Future<void> signUpPage() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('All fields are required')));
      return;
    } else {
      final user = Usermodel(name: name, email: email, password: password);

      _pref.setString('username', name);
      _pref.setString('password', password);
      _pref.setBool('log', true);
      clear();
      adduser(user);

      print("data added");

      var box = await Hive.openBox('userBox');

      await box.put('username', name);
      await box.put('email', email);
      await box.put('password', password);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const BottomnavigationbarPage()),
      );
    }
  }
}
