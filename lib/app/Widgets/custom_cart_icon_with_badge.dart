import 'package:flutter/material.dart';
import 'package:food_delivery/app/routes/routes.dart';

class CartIconWithBadge extends StatelessWidget {
  final int cartItemCount;

  CartIconWithBadge({required this.cartItemCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteName.cart);
          },
          icon: Image.asset(
            'assets/imgs/cart.png',
            width: 30,
            height: 30,
          ),
        ),
        // Badge displaying the item count
        if (cartItemCount >
            0) // Only show the badge if cartItemCount is greater than 0
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                '$cartItemCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
