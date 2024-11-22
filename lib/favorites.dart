import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Gap(50),
          ListTile(
            title: Text(
              'Favorites',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Gap(30),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              color: const Color.fromARGB(255, 233, 245, 255),
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/veg1.jpg'),
                  Gap(20),
                  ListTile(
                    title: Text(' Veg Salad'),
                    subtitle: Text('  veg'),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.thumb_up_alt_outlined)),
                  )
                ],
              ),
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              color: const Color.fromARGB(255, 233, 245, 255),
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap(20),
                  Image.asset('assets/non veg4.jpeg'),
                  Gap(20),
                  ListTile(
                    title: Text('Cake'),
                    subtitle: Text('Non - veg'),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.thumb_up_alt_outlined)),
                  )
                ],
              ),
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              color: const Color.fromARGB(255, 233, 245, 255),
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap(20),
                  Image.asset('assets/veg4.jpg'),
                  Gap(20),
                  ListTile(
                    title: Text('Apple jam'),
                    subtitle: Text('  veg'),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.thumb_up_alt_outlined)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
