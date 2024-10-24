import 'package:flutter/material.dart';

class HistoryViewModal extends ChangeNotifier {
  final List<Map<String, dynamic>> historyData = [
    {
      'date': '2022/02/24',
      'invoice': '002',
      'vat': 115,
      'serviceCharges': 100,
      'delivery': 50,
      'total': 1150,
      'products': [
        {'productName': 'Tsura Maki', 'pices': 6, 'price': 885}
      ]
    },
    {
      'date': '2022/02/23',
      'invoice': '001',
      'vat': 115,
      'serviceCharges': 100,
      'delivery': 50,
      'total': 1150,
      'products': [
        {'productName': 'Tsura Maki', 'pices': 6, 'price': 885}
      ]
    },
  ];
}
