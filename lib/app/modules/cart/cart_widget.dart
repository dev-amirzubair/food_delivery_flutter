import 'package:flutter/material.dart';
import 'package:food_delivery/app/Widgets/cutom_counter_widget.dart';
import 'package:food_delivery/app/routes/routes.dart';
import 'package:food_delivery/app/modules/cart/model.dart';
import 'package:food_delivery/app/modules/cart/viewModel.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              // Navigate to home to add more items
              Navigator.pushNamed(context, RouteName.home);
            },
          ),
        ],
      ),
      body: Consumer<CartModel>(
        builder: (context, cartModel, child) {
          return cartModel.itemCount > 0
              ? Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Two items per row
                          childAspectRatio:
                              0.8, // Adjust the aspect ratio as needed
                          mainAxisSpacing: 10.0, // Space between rows
                          crossAxisSpacing: 10.0, // Space between columns
                        ),
                        itemCount: cartModel.itemCount,
                        itemBuilder: (context, index) {
                          final cartItem = cartModel.cartItems[index];
                          return Card(
                            margin: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                // Image at the top, filling the width
                                SizedBox(
                                  height: 100, // Adjust height as needed
                                  width: double.infinity,
                                  child: Image.asset(
                                    cartItem.imageUrl,
                                    fit: BoxFit.cover, // Fill the container
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartItem.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        SizedBox(height: 4.0),
                                        Text(
                                          's ${cartItem.price}',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        CounterWidget(
                                            counter: cartItem.quantity,
                                            onQuantityChanged: (val) =>
                                                Provider.of<CartModel>(context,
                                                        listen: false)
                                                    .updateQuantity(
                                                        cartItem, val)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    // Total Price Section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Total: \$${calculateTotal(cartModel.cartItems).toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text('Your cart is empty'),
                );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteName.home);
          },
          child: Text('Add More'),
        ),
      ),
    );
  }

  double calculateTotal(List<CartItem> items) {
    double total = 0.0;
    for (var item in items) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
