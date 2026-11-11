/*import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/home.dart';

import '../Services/ProductsService.dart';

class Productscreen extends StatefulWidget {
  const Productscreen({super.key});

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {
  final ProductService ps = ProductService();
  late Future<List<dynamic>> productsList;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    productsList = ps.getproducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*  appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Products',

          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
         leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen1()));
        }, icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.lightGreen,

      ),*/
      body:
          // The Error is : builder function

          FutureBuilder<List<dynamic>>(
        future: productsList,
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
          final ProductList2Masalan = snapshot.data ?? [];
          if (ProductList2Masalan.isEmpty) {
            return const Center(
              child: Text('No products Found'),
            );
          }
          return GridView.builder(
              padding: EdgeInsets.all(22),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75),
              itemCount: ProductList2Masalan.length,
              itemBuilder: (context, index) {
                final CurrentProduct = ProductList2Masalan[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: Image.network(
                          CurrentProduct['thumbnail']?.toString() ?? '',
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
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(CurrentProduct['title']?.toString() ?? ''),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('price:'),
                            const SizedBox(width: 5,),
                            Text(CurrentProduct['price']?.toString() ?? ''),
                            const SizedBox(width: 3,),
                            const Text('QR'),
                          ],
                        ),
                      ),
                      //  Text(CurrentProduct['price']?.toString()??''),
                      const Text('category:'),
                      Text(CurrentProduct['category']?.toString() ?? ''),

                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/home.dart';
import '../Services/ProductsService.dart';

class Productscreen extends StatefulWidget {
  // 🌟 1. استقبال اسم القسم المختار من صفحة الهوم، وافتراضياً قيمته 'All'
  final String selectedCategory;
  final String searchQuery; //// add by now

  const Productscreen({
    super.key,
    this.selectedCategory = 'All',
    this.searchQuery = '', ///// add now
  });

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {
  final ProductService ps = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        // 🌟 2. هنا نضع الشرط الذكي: إذا كان القسم 'All' اجلب كل المنتجات، غير ذلك استدعي دالة الأقسام الجديدة
        future: widget.selectedCategory == 'All'
            ? ps.getproducts()
            : ps.getProductsByCategory(widget.selectedCategory),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Error :${snapshot.error}'),
              ),
            );
          }
          final ProductList2Masalan = snapshot.data ?? [];
          if (ProductList2Masalan.isEmpty) {
            return const Center(
              child: Text('No products Found'),
            );
          }
          return GridView.builder(
              padding: const EdgeInsets.all(22),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65), // قمنا بزيادة الطول قليلاً (0.65) ليتسع للبيانات الإضافية المكتوبة بالأسفل بشكل مريح
              itemCount: ProductList2Masalan.length,
              itemBuilder: (context, index) {
                final CurrentProduct = ProductList2Masalan[index];
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
                            child: Image.network(
                              CurrentProduct['thumbnail']?.toString() ?? '',
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
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              CurrentProduct['title']?.toString() ?? '',
                              maxLines: 1, // حصر العنوان في سطر واحد لمنع تداخل النصوص واختلاف أحجام الكروت
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('price:'),
                            const SizedBox(width: 5,),
                            Text(CurrentProduct['price']?.toString() ?? ''),
                            const SizedBox(width: 3,),
                            const Text('QR'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text('category:', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text(
                        CurrentProduct['category']?.toString() ?? '',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}*/ // this is the right code but i added the search


import 'package:flutter/material.dart';
import '../Services/ProductsService.dart';

class Productscreen extends StatefulWidget {
  final String selectedCategory;
  final String searchQuery; // 1. متغير استقبال نص البحث

  const Productscreen({
    super.key,
    this.selectedCategory = 'All',
    this.searchQuery = '', // قيمته الافتراضية نص فارغ
  });

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {
  final ProductService ps = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        // جلب المنتجات حسب القسم المختار
        future: widget.selectedCategory == 'All'
            ? ps.getproducts()
            : ps.getProductsByCategory(widget.selectedCategory),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.lightGreen),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Error :${snapshot.error}'),
              ),
            );
          }

          final allProducts = snapshot.data ?? [];

          // 2. تصفية المنتجات بناءً على نص البحث القادم من صفحة الهوم
          final filteredProducts = allProducts.where((product) {
            final title = (product['title'] ?? '').toString().toLowerCase();
            return title.contains(widget.searchQuery.toLowerCase());
          }).toList();

          // إذا لم توجد نتائج مطابقة للبحث أو القسم
          if (filteredProducts.isEmpty) {
            return const Center(
              child: Text('No products Found'),
            );
          }

          // 3. عرض المنتجات المصفاة في الشبكة
          return GridView.builder(
            padding: const EdgeInsets.all(22),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.65,
            ),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final currentProduct = filteredProducts[index];
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
                        child: Image.network(
                          currentProduct['thumbnail']?.toString() ?? '',
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
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        currentProduct['title']?.toString() ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('price:'),
                        const SizedBox(width: 5),
                        Text(currentProduct['price']?.toString() ?? ''),
                        const SizedBox(width: 3),
                        const Text('QR'),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'category:',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      currentProduct['category']?.toString() ?? '',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}


