import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/profilePage.dart';
import 'package:mobile_project/Services/CartsService.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  final Cartsservice ps = Cartsservice();
  late Future<List<dynamic>> cartsList;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    cartsList = ps.getcarts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Carts',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.lightGreen,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: cartsList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Error :${snapshot.error}'),
              ),
            );
          }
          final CartList2 = snapshot.data ?? [];
          if (CartList2.isEmpty) {
            return const Center(
              child: Text('No Carts Found'),
            );
          }
          return GridView.builder(
              padding: const EdgeInsets.all(22),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75),
              itemCount: CartList2.length,
              itemBuilder: (context, index) {
                final CurrentCart = CartList2[index];
                final product = CurrentCart['products'][0];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              product['thumbnail']?.toString() ?? '',
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(
                                    Icons.image_not_supported,
                                    size: 50,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(CurrentCart['title']?.toString() ?? ''),
                      )
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
