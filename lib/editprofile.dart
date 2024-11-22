import 'dart:io';

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_project_app/database/function.dart';

import 'package:hive_project_app/models/usermodel.dart';
import 'package:hive_project_app/profiledetails.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  int? index;
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? selectimage;

  Future<void> take() async {
    var box = await Hive.openBox<Usermodel>('userone');

    List<Usermodel>? profileList = box.values.toList();
    if (profileList.isNotEmpty) {
      var profile = profileList.first;
      setState(() {
        nameController.text = profile.name!;
        emailController.text = profile.email!;
        passwordController.text = profile.password!;
        phonenumberController.text = profile.phonenumber!;
        selectimage = profile.image != null ? File(profile.image!) : null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    take();
  }

  Widget build(BuildContext context) {
    nameController = TextEditingController(text: nameController.text);
    emailController = TextEditingController(text: passwordController.text);
    phonenumberController =
        TextEditingController(text: phonenumberController.text);
    passwordController = TextEditingController(text: passwordController.text);
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Gap(50),
      ListTile(
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Gap(30),
      Center(
        child: GestureDetector(
          onTap: () {
            _pickImage();
          },
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 100,
              child: _image != null
                  ? Image.file(_image!)
                  : Image.asset('assets/Screenshot 2024-11-13 012901.png'),
            ),
          ),
        ),
      ),
      Gap(30),
      Padding(
        padding: const EdgeInsets.all(15),
        child: TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 232, 244, 254),
            border: InputBorder.none,
            hintText: 'Username',
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 232, 244, 254),
            border: InputBorder.none,
            hintText: 'Email Id',
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: TextFormField(
          controller: phonenumberController,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 232, 244, 254),
            border: InputBorder.none,
            hintText: 'phone number',
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 232, 244, 254),
            border: InputBorder.none,
            hintText: 'password',
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          ),
        ),
      ),
      Gap(20),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 10, backgroundColor: Colors.blue),
          onPressed: () {
            editbtn(context);
          },
          child: Text(
            'Save',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
          ))
    ])));
  }

  void editbtn(BuildContext context) async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phonenumber = phonenumberController.text.trim();
    final password = passwordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        phonenumber.isEmpty ||
        password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('title or note is empty')));
    } else {
      final editAll = Usermodel(
          name: name,
          email: email,
          password: password,
          phonenumber: phonenumber,
          image: _image?.path ?? '');

      editUser(0, editAll);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Profiledetails()));
    }
  }

  Future<void> _pickImage() async {
    final PickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (PickedFile != null) {
        _image = File(PickedFile.path);
      }
    });
  }
}
