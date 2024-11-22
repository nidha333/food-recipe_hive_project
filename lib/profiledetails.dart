// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_project_app/database/function.dart';
// import 'package:hive_project_app/editprofile.dart';
// import 'package:hive_project_app/favorites.dart';
// import 'package:hive_project_app/dashboard.dart';
// import 'package:hive_project_app/registerpage.dart';

// class Profiledetails extends StatefulWidget {
//   const Profiledetails({super.key});

//   @override
//   State<Profiledetails> createState() => _ProfiledetailsState();
// }

// class _ProfiledetailsState extends State<Profiledetails> {
//   final nameController = TextEditingController();

//   var name = '';
//   var email = '';
//   var phonenumber = '';
//   var password = '';

//   @override
//   void initState() {
//     super.initState();
//     _fetchUsername();
//   }

//   void _fetchUsername() async {
//     var box = await Hive.openBox('userBox');
//     setState(() {
//       name = box.get('username', defaultValue: 'Guest');
//       email = box.get('email', defaultValue: '');
//       phonenumber = phonenumber;
//       password = password;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Gap(50),
//             const ListTile(
//               title: Text(
//                 'Profile',
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const Gap(20),
//             Card(
//               color: Colors.white,
//               elevation: 10,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(50),
//                 child: Container(
//                   width: 200,
//                   height: 200,
//                   color: Colors.white,
//                   child: Center(
//                     child:
//                         Image.asset('assets/Screenshot 2024-11-13 012901.png'),
//                   ),
//                 ),
//               ),
//             ),
//             const Gap(10),
//             ValueListenableBuilder(
//               valueListenable: userModelNotifier,
//               builder: (context, value, child) {
//                 return ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     elevation: 10,
//                     backgroundColor: const Color.fromARGB(255, 229, 242, 253),
//                   ),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Profile()));
//                   },
//                   child: const Text(
//                     'Edit Profile',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 );
//               },
//             ),
//             const Gap(30),
//             SizedBox(
//               width: 300,
//               height: 300,
//               child: Card(
//                 color: Color.fromARGB(255, 200, 230, 255),
//                 elevation: 10,
//                 child: ValueListenableBuilder(
//                   valueListenable: userModelNotifier,
//                   builder: (context, value, child) {
//                     return Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           value.first.name.toString(),
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         Gap(20),
//                         Text(
//                           value.first.email.toString(),
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         Gap(20),
//                         Text(
//                           value.first.phonenumber.toString(),
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         Gap(20),
//                         Text(
//                           value.first.password.toString(),
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ),
//             const Gap(50),
//             Container(
//               width: 500,
//               height: 250,
//               color: const Color.fromARGB(255, 227, 240, 250),
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: const Text(
//                       'Favorites',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     trailing: IconButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => const Favorites()));
//                       },
//                       icon: const Icon(Icons.favorite_border_outlined),
//                     ),
//                   ),
//                   const Divider(thickness: 3),
//                   ListTile(
//                     title: const Text(
//                       'DashBoard',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     trailing: IconButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => Dashbord()));
//                       },
//                       icon: const Icon(Icons.dashboard_customize_outlined),
//                     ),
//                   ),
//                   const Divider(thickness: 3),
//                   ListTile(
//                     title: const Text(
//                       'Logout',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, color: Colors.red),
//                     ),
//                     trailing: IconButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => const Registerpage()));
//                       },
//                       icon: const Icon(Icons.logout_outlined),
//                     ),
//                   ),
//                   const Divider(thickness: 3),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_project_app/database/function.dart';
import 'package:hive_project_app/editprofile.dart';
import 'package:hive_project_app/favorites.dart';
import 'package:hive_project_app/dashboard.dart';
import 'package:hive_project_app/registerpage.dart';

class Profiledetails extends StatefulWidget {
  const Profiledetails({super.key});

  @override
  State<Profiledetails> createState() => _ProfiledetailsState();
}

class _ProfiledetailsState extends State<Profiledetails> {
  final nameController = TextEditingController();

  var name = '';
  var email = '';
  var phonenumber = '';
  var password = '';

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  void _fetchUsername() async {
    var box = await Hive.openBox('userBox');
    setState(() {
      name = box.get('username', defaultValue: 'Guest');
      email = box.get('email', defaultValue: '');
      phonenumber = phonenumber;
      password = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ValueListenableBuilder(
            valueListenable: userModelNotifier,
            builder: (context, value, child) {
              return Column(
                children: [
                  const Gap(50),
                  const ListTile(
                    title: Text(
                      'Profile',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Gap(20),
                  Card(
                    color: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Colors.white,
                        child: Center(
                          child: value.first.image != null
                              ? Image.file(File(value.first.image!))
                              : Image.asset('assets/veg1.jpg'),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  ValueListenableBuilder(
                    valueListenable: userModelNotifier,
                    builder: (context, value, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor:
                              const Color.fromARGB(255, 229, 242, 253),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
                  const Gap(30),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: Card(
                      color: Color.fromARGB(255, 200, 230, 255),
                      elevation: 10,
                      child: ValueListenableBuilder(
                        valueListenable: userModelNotifier,
                        builder: (context, value, child) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                value.first.name.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              Gap(20),
                              Text(
                                value.first.email.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              Gap(20),
                              Text(
                                value.first.phonenumber.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              Gap(20),
                              Text(
                                value.first.password.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const Gap(50),
                  Container(
                    width: 500,
                    height: 250,
                    color: const Color.fromARGB(255, 227, 240, 250),
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            'Favorites',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Favorites()));
                            },
                            icon: const Icon(Icons.favorite_border_outlined),
                          ),
                        ),
                        const Divider(thickness: 3),
                        ListTile(
                          title: const Text(
                            'DashBoard',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Dashbord()));
                            },
                            icon:
                                const Icon(Icons.dashboard_customize_outlined),
                          ),
                        ),
                        const Divider(thickness: 3),
                        ListTile(
                          title: const Text(
                            'Logout',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Registerpage()));
                            },
                            icon: const Icon(Icons.logout_outlined),
                          ),
                        ),
                        const Divider(thickness: 3),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
