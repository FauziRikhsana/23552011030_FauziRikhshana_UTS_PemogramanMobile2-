import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';

class CartSummaryPage extends StatelessWidget {
  const CartSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ringkasan Keranjang")),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          // Cek kalau keranjang kosong
          if (state.items.isEmpty) {
            return const Center(child: Text("Keranjang kosong"));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    final product = item["product"];
                    final qty = item["qty"] ?? 0;

                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text("Qty: $qty"),
                      trailing: Text("Rp ${product.price * qty}"),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Item : ${context.read<CartCubit>().getTotalItems()}",
                    ),
                    Text(
                      "Total Harga : Rp ${context.read<CartCubit>().getTotalPrice()}",
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        context.read<CartCubit>().clearCart();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Checkout berhasil! Keranjang dikosongkan."),
                          ),
                        );
                      },
                      child: const Text("Checkout"),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
