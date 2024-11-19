import 'package:flutter/material.dart';
import 'package:shtoree/screens/addreview_form.dart';
import 'package:shtoree/screens/list_product_rating.dart';
import 'package:shtoree/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Material(
      color: item.name == "Tambah Review"
          ? Colors.green
          : item.name == "Lihat Daftar Review"
              ? Colors.blue
              : Colors.red,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          if (item.name == "Tambah Review") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddReviewFormPage(),
              ),
            );
          } if (item.name == "Lihat Daftar Review") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductPage(),
              ),
            );
          } else if (item.name == "Logout") {
            final response = await request.logout(
              "http://127.0.0.1:8000/auth/logout/",
            );
            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Sampai jumpa, $uname."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
