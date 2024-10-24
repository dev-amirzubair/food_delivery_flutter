import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/Widgets/custom_cart_icon_with_badge.dart';
import 'package:food_delivery/app/Widgets/custom_product_card.dart';
import 'package:food_delivery/app/constants/colors.dart';
import 'package:food_delivery/app/modules/cart/viewModel.dart';
import 'package:food_delivery/app/modules/home/home/viewmodel.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomeViewModel>(context);
    final cartCount = Provider.of<CartModel>(context).itemCount;
    // Implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar and icons
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color:
                              AppColors.grey.withOpacity(0.3), // Shadow color
                          spreadRadius: 2, // How much the shadow spreads
                          blurRadius: 5, // Blur effect
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: tr('search'), // Placeholder text
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        prefixIcon: Icon(Icons.search, color: AppColors.grey),
                        suffixIcon:
                            Icon(Icons.filter_list, color: AppColors.grey),
                        border: InputBorder.none, // No border
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/imgs/phone.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                CartIconWithBadge(cartItemCount: cartCount)
                // IconButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, RouteName.cart);
                //   },
                //   icon: Image.asset(
                //     'assets/imgs/cart.png',
                //     width: 30,
                //     height: 30,
                //   ),
                // ),
              ],
            ),
            // Content after search bar
            SizedBox(height: 30),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/imgs/flames.png',
                      height: 125,
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr('popularDrinks'),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: ProductCard(
                                  imagePath: 'assets/imgs/takiyoki.png',
                                  title: 'Takiyoki',
                                  price: '545.00',
                                  onTap: () {
                                    home.showProductDetails(context, '1');
                                  },
                                ),
                              ),
                              SizedBox(
                                  width: 16), // Add spacing between columns
                              Flexible(
                                child: ProductCard(
                                  imagePath: 'assets/imgs/sushi.png',
                                  title: 'Sushi Uramaki',
                                  price: '785.00',
                                  onTap: () {
                                    home.showProductDetails(context, '2');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr('popularFoods'),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: ProductCard(
                                  imagePath: 'assets/imgs/cappcino.png',
                                  title: 'Refreshing Drink',
                                  price: '195.00',
                                  onTap: () {
                                    home.showProductDetails(context, '3');
                                  },
                                ),
                              ),
                              SizedBox(
                                  width: 16), // Add spacing between columns
                              Flexible(
                                child: ProductCard(
                                  imagePath: 'assets/imgs/latte.png',
                                  title: 'Coffee latte',
                                  price: '195.00',
                                  onTap: () {
                                    home.showProductDetails(context, '4');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/imgs/offer.png',
                      height: 125,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ),
            // Images and text content
          ],
        ),
      ),
    );
  }
}
