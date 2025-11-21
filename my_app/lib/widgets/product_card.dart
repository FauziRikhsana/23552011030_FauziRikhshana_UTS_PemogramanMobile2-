import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.image, height: 120, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(product.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text("Rp ${product.price}"),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              context.read<CartCubit>().addToCart(product);
            },
            child: Text("Tambahkan"),
          )
        ],
      ),
    );
  }
}
