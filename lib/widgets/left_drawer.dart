import 'package:flutter/material.dart';
import 'package:shtoree/screens/menu.dart';
import 'package:shtoree/screens/addreview_form.dart';
import 'package:shtoree/screens/list_product_rating.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'shtoree',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Aplikasi untuk mengelola dan menambah item di shtoree!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Tambah Review'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddReviewFormPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lihat Daftar Review'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
