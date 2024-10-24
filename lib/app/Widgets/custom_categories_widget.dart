import 'package:flutter/material.dart';
import 'package:food_delivery/app/constants/colors.dart';

class CategoriesList extends StatefulWidget {
  final List<String> categories; // Accept categories as a parameter
  final String?
      initialSelectedCategory; // Optionally pass an initially selected category

  CategoriesList({
    super.key,
    required this.categories,
    this.initialSelectedCategory,
  });

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  String? selectedCategory; // Track selected category

  @override
  void initState() {
    super.initState();
    selectedCategory =
        widget.initialSelectedCategory; // Initialize with passed value
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35, // Adjust height to fit category items
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Makes the list horizontal
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          final isSelected = category == selectedCategory; // Check if selected

          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 4), // Spacing between items
            child: CategoryItem(
              title: category,
              isSelected: isSelected, // Pass the selected state
              onTap: () {
                setState(() {
                  selectedCategory = category; // Update the selected state
                });
                print('Selected: $category');
              },
            ),
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.title,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle category tap
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? AppColors.black
                  : AppColors.grey, // Text color changes if selected
            ),
          ),
        ),
      ),
    );
  }
}
