import 'package:flutter/material.dart';
import 'cart_grid_page.dart';
import 'cart_summary_page.dart';

class CartHomePage extends StatelessWidget {
  const CartHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aplikasi Oppa Coin")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CartGridPage()));
              },
              child: Text("Menu Rasa"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CartSummaryPage()));
              },
              child: Text("Lihat Keranjang"),
            ),
          ],
        ),
      ),
    );
  }
}
