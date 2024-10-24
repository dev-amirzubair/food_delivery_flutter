import 'package:flutter/material.dart';

class MenuViewModal extends ChangeNotifier {
  List<String> foodCategories = [
    'Shushi uramaki',
    'Shushi hosomaki',
    'Dimsum',
    'Shushi uramaki'
  ];
  List<String> drinksCategories = [
    'Coffee',
    'Cold coffee',
    'Cold Beverage',
    'Classic cocktail',
    'Signature cocktail'
  ];

  List<Map<String, dynamic>> foodProducts = [
    {'id': 1, 'name': 'TSURA MAKI', 'description': 'NRP 885.00'},
    {'id': 2, 'name': 'DYNAMITE MAKI', 'description': 'NRP 885.00'},
    {'id': 3, 'name': 'EBI ROKKU MAKI', 'description': 'NRP 785.00'},
    {'id': 4, 'name': 'CALIFORNIA MAKI', 'description': 'NRP 785.00'},
    {'id': 5, 'name': 'KAZAN MAKI', 'description': 'NRP 785.00'},
    {'id': 6, 'name': 'DRAGON MAKI', 'description': 'NRP 785.00'},
    {'id': 7, 'name': 'GURIN’ EKO MAKI', 'description': 'NRP 454.00'},
    {'id': 8, 'name': 'ABOKADO MAKI', 'description': 'NRP 454.00'},
    {'id': 9, 'name': 'CRISP KINOKO MAKI ', 'description': 'NRP 454.00'},
    {'id': 10, 'name': 'SHINSEN’NA MAKI ', 'description': 'NRP 454.00'},
  ];

  List<Map<String, dynamic>> drinksProducts = [
    {'id': 1, 'name': 'Espresso single', 'description': 'NRP 125.00'},
    {'id': 2, 'name': 'Espresso double', 'description': 'NRP 195.00'},
    {'id': 3, 'name': 'Americano', 'description': 'NRP 175.00'},
    {'id': 4, 'name': 'Cappuccino', 'description': 'NRP 195.00'},
    {'id': 5, 'name': 'Caffe Latte', 'description': 'NRP 195.00'},
    {'id': 6, 'name': 'Caffe Mocha', 'description': 'NRP 250.00'},
    {'id': 7, 'name': 'Flavoured Latte', 'description': 'NRP 235.00'},
    {'id': 8, 'name': 'Honey Latte', 'description': 'NRP 235.00'},
  ];
}
