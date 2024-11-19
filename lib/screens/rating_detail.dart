import 'package:flutter/material.dart';
import 'package:shtoree/models/rating.dart';

class RatingDetailPage extends StatelessWidget {
  final Product product;

  const RatingDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Detail'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),
            // Harga produk
            Text(
              "Price: Rp ${product.fields.price}",
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 10),
            // Feedback produk
            Text(
              product.fields.feedback,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 10),
            // Rating produk dengan ikon bintang
            Row(
              children: [
                Text(
                  "${product.fields.rating}",
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Tombol kembali ke daftar item
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: const Text(
                  'Back to List',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
