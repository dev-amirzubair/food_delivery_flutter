import 'package:flutter/material.dart';
import 'package:food_delivery/app/constants/colors.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.imagePath, // Path to the image
    required this.title, // Title of the product
    required this.price,
    required this.onTap, // Price of the product
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // Using Container to create a card-like effect without rounded corners
        decoration: BoxDecoration(
          color: Colors.transparent, // Transparent background
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 224, 223, 223)
                  .withOpacity(0.5), // Shadow color
              spreadRadius: 2, // How much the shadow spreads
              blurRadius: 5, // Blur effect
              offset: Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Image.asset(
              imagePath,
              height: 150, // Set height for the image
              width: double.infinity, // Full width
              fit: BoxFit.cover, // Ensures the image covers the available space
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4), // Small space between title and price
                  // Product price
                  Text(
                    "NRP $price",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.green, // Highlight the price in green
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
