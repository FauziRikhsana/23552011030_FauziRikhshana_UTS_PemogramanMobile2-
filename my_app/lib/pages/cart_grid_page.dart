import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';

class CartGridPage extends StatelessWidget {
  CartGridPage({super.key});

  final products = [
    ProductModel(
      id: "1",
      name: "Produk A",
      price: 15000,
      image: "assets/img/strawberry.jpg",
    ),
    ProductModel(
      id: "2",
      name: "Produk B",
      price: 20000,
      image: "assets/img/blueberry.jpg",
    ),
    ProductModel(
      id: "3",
      name: "Produk c",
      price: 20000,
      image: "assets/img/chocolate.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Produk")),
      body: GridView.count(
        crossAxisCount: 2,
        children: products.map((p) => ProductCard(product: p)).toList(),
      ),
    );
  }
}
