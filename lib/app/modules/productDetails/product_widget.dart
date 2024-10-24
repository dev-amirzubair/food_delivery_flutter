import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/Widgets/cusotm_body_widget.dart';
import 'package:food_delivery/app/Widgets/custom_cart_icon_with_badge.dart';
import 'package:food_delivery/app/Widgets/cutom_counter_widget.dart';
import 'package:food_delivery/app/constants/colors.dart';
import 'package:food_delivery/app/modules/cart/model.dart';
import 'package:food_delivery/app/modules/cart/viewModel.dart';
import 'package:food_delivery/app/modules/productDetails/viewModal.dart';
import 'package:provider/provider.dart';

class ProductInfoWidget extends StatefulWidget {
  final String id;

  ProductInfoWidget({
    required this.id,
  });

  @override
  State<ProductInfoWidget> createState() => _ProductInfoWidgetState();
}

class _ProductInfoWidgetState extends State<ProductInfoWidget> {
  int quanitity = 1;
  @override
  Widget build(BuildContext context) {
    final productDetails = Provider.of<ProductDetailsViewModal>(context);
    final cart = Provider.of<CartModel>(context);
    return FutureBuilder(
        future: productDetails.getProductDetails(widget.id),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error: ${snapshot.error}')); // Show an error if one occurred
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text('No data available')); // Handle if there's no data
          } else {
            var currentItem = snapshot.data![0];
            print(currentItem);
            print(currentItem['top_reviews']);
            return Scaffold(
              body: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      currentItem['url'],
                      fit: BoxFit.contain,
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          CartIconWithBadge(cartItemCount: cart.itemCount)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 260),
                    child: Column(
                      children: [
                        CusotmBodyWidget(
                          childern: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          currentItem['name'],
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Icon(
                                          Icons.favorite_border_outlined,
                                          color: AppColors.red,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      tr("ingredients"),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      currentItem['ingredients'],
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      '${tr('price')}: NRP ${currentItem["price"]}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${tr("quanitity")}: ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        CounterWidget(
                                          counter: 1,
                                          maxCount: currentItem['stock'],
                                          onQuantityChanged: (val) {
                                            setState(() {
                                              quanitity = val;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          cart.addItem(CartItem(
                                              name: currentItem['name'],
                                              imageUrl: currentItem['url'],
                                              price: currentItem['price'],
                                              quantity: quanitity));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('Added to cart!'),
                                          ));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          elevation: 5,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              tr('add_to_cart'),
                                              style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.shopping_cart_outlined,
                                              color: AppColors.white,
                                            )
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(tr('reviews')),
                                  ),
                                  Column(
                                    children: currentItem['top_reviews']
                                        .map<Widget>((review) {
                                      return ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(review[
                                                      'img'] ==
                                                  ''
                                              ? 'assets/imgs/add_image.png'
                                              : review[
                                                  'img']), // Display image if available
                                        ),
                                        title: Text(review['name']),
                                        subtitle: Text(review['comment']),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '${review['rating']}', // Show rating at the end
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: AppColors.grey,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
