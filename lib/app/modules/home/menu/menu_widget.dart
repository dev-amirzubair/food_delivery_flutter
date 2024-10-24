import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/Widgets/cusotm_body_widget.dart';
import 'package:food_delivery/app/Widgets/custom_categories_widget.dart';
import 'package:food_delivery/app/Widgets/custom_list_widget.dart';
import 'package:food_delivery/app/constants/colors.dart';
import 'package:food_delivery/app/modules/home/menu/viewmodel.dart';
import 'package:provider/provider.dart';

class MenuTab extends StatefulWidget {
  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  TextEditingController searchController = TextEditingController();
  String category = tr('foods');

  @override
  Widget build(BuildContext context) {
    final menuViewModal = Provider.of<MenuViewModal>(context);
    final finalCategiesList = category == tr('drinks')
        ? menuViewModal.drinksCategories
        : menuViewModal.foodCategories;
    final finalProductsList = category == tr('drinks')
        ? menuViewModal.drinksProducts
        : menuViewModal.foodProducts;
    final String currentCategorySelected = finalCategiesList[0];
    // Implement build
    return Scaffold(
      body: Column(
        children: [
          // Search bar and icons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                    child: Text(
                      "Menu",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
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
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/imgs/cart.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
          // Images and text content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
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
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CusotmBodyWidget(
            childern: Padding(
              padding: const EdgeInsets.all(23.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              category = tr('foods');
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: category == tr('foods')
                                ? AppColors.primaryColor
                                : AppColors.whiteLight,
                            elevation: 1,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Text(
                              tr('foods'),
                              style: TextStyle(
                                color: category == tr('foods')
                                    ? AppColors.white
                                    : AppColors.grey,
                              ),
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              category = tr('drinks');
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: category == tr('drinks')
                                ? AppColors.secondaryColor
                                : AppColors.whiteLight,
                            elevation: 1,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Text(
                              tr('drinks'),
                              style: TextStyle(
                                  color: category == tr('drinks')
                                      ? AppColors.white
                                      : AppColors.grey),
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CategoriesList(
                      categories: finalCategiesList,
                      initialSelectedCategory: currentCategorySelected,
                    ),
                  ),
                  Expanded(
                    child: CustomList(
                      items: finalProductsList,
                      onPlusPressed: (val) => print("Added item: ${val.name}"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
