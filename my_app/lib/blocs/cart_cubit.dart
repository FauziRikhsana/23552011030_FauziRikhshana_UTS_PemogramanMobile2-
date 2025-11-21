import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';

class CartState {
  final List<Map<String, dynamic>> items;

  CartState({required this.items});

  CartState copyWith({List<Map<String, dynamic>>? items}) {
    return CartState(items: items ?? this.items);
  }
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(items: []));

  void addToCart(ProductModel product) {
    final existing = state.items.firstWhere(
      (e) => e['product'].id == product.id,
      orElse: () => {},
    );

    if (existing.isNotEmpty) {
      updateQuantity(product, (existing['qty'] as int) + 1);
    } else {
      emit(CartState(items: [
        ...state.items,
        {'product': product, 'qty': 1}
      ]));
    }
  }

  void removeFromCart(ProductModel product) {
    emit(CartState(
      items: state.items.where(
        (e) => e['product'].id != product.id,
      ).toList(),
    ));
  }

  void updateQuantity(ProductModel product, int qty) {
    if (qty <= 0) {
      removeFromCart(product);
      return;
    }

    final updated = state.items.map((e) {
      if (e['product'].id == product.id) {
        return {'product': e['product'], 'qty': qty};
      }
      return e;
    }).toList();

    emit(CartState(items: updated));
  }

  int getTotalItems() {
    return state.items.fold<int>(0, (sum, e) => sum + (e['qty'] as int));
  }

  int getTotalPrice() {
    return state.items.fold<int>(
      0,
      (sum, e) =>
          sum + ((e['product'].price as int) * (e['qty'] as int)),
    );
  }

  void clearCart() {
    emit(CartState(items: []));
  }
}
