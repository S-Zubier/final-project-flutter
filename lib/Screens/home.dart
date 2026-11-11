
import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/CartScreen.dart';
import 'package:mobile_project/Screens/ProductScreen.dart';
import 'package:mobile_project/Screens/profilePage.dart';
import 'package:mobile_project/Screens/loginSecreen.dart';
import 'package:mobile_project/Screens/settingScreen.dart';
import 'package:mobile_project/Services/theme_service.dart';
import '../Services/ProductsService.dart';

class HomeScreen1 extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool>? onThemeChanged;

  const HomeScreen1({
    super.key,
    this.isDarkMode = false,
    this.onThemeChanged,
  });

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  final ProductService ps = ProductService();
  late Future<List<dynamic>> productsList;
  late bool _localDarkMode;

  final List<String> categories = [
    'All',
    'Electronics',
    'Jewelry',
    'Men\'s Clothing',
    'Women\'s Clothing',
    'Shoes'
  ];
  int selectedCategoryIndex = 0;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    productsList = ps.getproducts();
    _localDarkMode = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Image.asset('assets/images/logoshop.png', scale: 4.5),
          ],
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.lightGreen),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Colors.lightGreen),
                ),
                accountName: Text('Samar',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                accountEmail: Text('samar@gmail.com'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
                leading: const Icon(Icons.account_circle),
                title: const Text('Profile'),
              ),
              const Divider(height: 5),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cartscreen()),
                  );
                },
                leading: const Icon(Icons.shopping_cart),
                title: const Text('Carts'),
              ),
              const Divider(height: 5),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About Application'),
                onTap: () {
                  Navigator.of(context).pop();
                  showAboutDialog(
                    context: context,
                    applicationName: 'Your Things',
                    applicationVersion: '5.2.2',
                    applicationIcon:
                        Image.asset('assets/images/logoshop.png', scale: 3.2),
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text('E-commerce App For Products and Deals'),
                      ),
                    ],
                  );
                },
              ),
              const Divider(height: 5),
              SwitchListTile(
                secondary: Icon(
                  _localDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: _localDarkMode ? Colors.amber : Colors.grey,
                ),
                title: const Text('Dark Mode'),
                value: _localDarkMode,
                onChanged: (bool value) async {
                  setState(() {
                    _localDarkMode = value;
                  });
                  if (widget.onThemeChanged != null) {
                    widget.onThemeChanged!(value);
                  } else {
                    await ThemeService.saveTheme(value);
                  }
                },
              ),
              const Divider(height: 5),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Settingscreen()),
                  );
                },
                leading: const Icon(Icons.settings, color: Colors.red),
                title: const Text('Setting'),
              ),
              const Divider(height: 5),
              const Spacer(),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title:
                    const Text('Logout', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Loginscreen()),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.all(12),
                child:
                    Text('version 1.1.0', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // 1. شريط البحث
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: _localDarkMode ? Colors.grey : Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              ),
            ),
          ),

          // 2. شريط الأقسام الأفقي الدائري
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = selectedCategoryIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.lightGreen
                            : (_localDarkMode ? Colors.grey : Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : (_localDarkMode
                                    ? Colors.white70
                                    : Colors.black87),
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          // 3. استدعاء صفحة المنتجات وتمرير القسم المختار لها مباشرة
          Expanded(
            child: Productscreen(
              selectedCategory: categories[selectedCategoryIndex],
            ),
          ),
        ],
      ),
    );
  }
}
