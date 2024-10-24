import 'package:flutter/material.dart';

class ProductDetailsViewModal extends ChangeNotifier {
  List<Map<String, dynamic>> foodProducts = [
    {
      'id': '3',
      'name': 'Cappuchino',
      'price': 195.00,
      'url': 'assets/imgs/cappicino_details.png',
      'stock': 100,
      'isfav': false,
      'ingredients': 'Coco powder, ground coffee, milk',
      'top_reviews': [
        {
          'img': '',
          'name': 'Riaz Marceloz',
          'comment': 'Really good Food',
          'rating': 4.5
        },
        {
          'img': '',
          'name': 'Riaz Marceloz',
          'comment': 'Really good Food',
          'rating': 4.2
        }
      ]
    },
    {
      'id': '4',
      'name': 'Coffee latte',
      'price': 195.00,
      'url': 'assets/imgs/cappicino_details.png',
      'stock': 5,
      'isfav': false,
      'ingredients': 'Coco powder, ground coffee, milk',
      'top_reviews': [
        {
          'img': '',
          'name': 'Riaz Marceloz',
          'comment': 'Really good Food',
          'rating': 4.5
        }
      ]
    },
    {
      'id': '1',
      'name': 'Takiyoki',
      'price': 545.00,
      'url': 'assets/imgs/takiyoki_details.png',
      'stock': 5,
      'isfav': false,
      'ingredients': 'takiyoki sauce, soy sauce, bonito flakes, octopus',
      'top_reviews': [
        {
          'img': '',
          'name': 'Riaz Marceloz',
          'comment': 'Really good Food',
          'rating': 4.5
        },
        {
          'img': '',
          'name': 'Riaz Marceloz',
          'comment': 'Really good Food',
          'rating': 4.5
        },
        {
          'img': '',
          'name': 'Riaz Marceloz',
          'comment': 'Really good Food',
          'rating': 4.5
        },
        {
          'img': '',
          'name': 'Riaz Marceloz',
          'comment': 'Really good Food',
          'rating': 4.5
        }
      ]
    },
    {
      'id': '2',
      'name': 'Sushi Uramaki',
      'price': 785.00,
      'url': 'assets/imgs/sushi_details.png',
      'stock': 5,
      'isfav': false,
      'ingredients': 'creame cheese, sushi rice, fish, avacado, raw salmon',
      'top_reviews': [
        {
          'img': '',
          'name': 'Riaz Marceloz',
          'comment': 'Really good Food',
          'rating': 4.5
        }
      ]
    },
  ];

  Future<List<Map<String, dynamic>>> getProductDetails(String id) async {
    return foodProducts.where((item) => item['id'] == id).toList();
  }
}
