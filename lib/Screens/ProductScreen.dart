import 'package:flutter/material.dart';
import '../Services/ProductsService.dart';

class Productscreen extends StatefulWidget {
  final String selectedCategory;
  final String searchQuery; //   استقبال نص البحث

  const Productscreen({
    super.key,
    this.selectedCategory = 'All',
    this.searchQuery = '',
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

          //  تصفية المنتجات بناء على  البحث
          final filteredProducts = allProducts.where((product) {
            final title = (product['title'] ?? '').toString().toLowerCase();
            return title.contains(widget.searchQuery.toLowerCase());
          }).toList();

          if (filteredProducts.isEmpty) {
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
