import 'package:flutter/material.dart';

import 'CartScreen.dart';
import 'home.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Profile ',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightGreen,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen1()));
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.lightGreen),
            accountName: const Text('SAMAR'),
            accountEmail: const Text('samar@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.red[800],
              child: const Text(
                'S',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 190),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Will Make It Soon')));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.edit),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Edit Your Profile'),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )),
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cartscreen()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.add_shopping_cart_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text('My Orders'),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )),
                OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Will Make It Soon')));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.monitor_heart_rounded),
                        SizedBox(
                          width: 20,
                        ),
                        Text('wishList'),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ]));
  }
}
