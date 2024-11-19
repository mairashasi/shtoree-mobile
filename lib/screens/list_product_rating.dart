import 'package:flutter/material.dart';
import 'package:shtoree/models/rating.dart';
import 'package:shtoree/widgets/left_drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:shtoree/screens/rating_detail.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');

    // Melakukan decode response menjadi bentuk json
    var data = response;

    // Melakukan konversi data json menjadi object Product
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review List'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum ada review pada produk.',
                      style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  Product product = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman detail ketika item di klik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RatingDetailPage(product: product),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nama produk dengan style tebal
                          Text(
                            product.fields.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Harga produk
                          Text(
                            "Price: Rp ${product.fields.price}",
                            style: const TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Feedback produk
                          Text(
                            product.fields.feedback,
                            style: const TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Rating produk dengan ikon bintang
                          Row(
                            children: [
                              Text(
                                "${product.fields.rating}",
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
