import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/cart/model.dart';

class CartModel with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get itemCount => _cartItems.length;

  double get totalPrice => _cartItems.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );

  void addItem(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void updateQuantity(CartItem item, int quanitity) {
    item.quantity = quanitity;
    notifyListeners();
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _cartItems.remove(item);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
