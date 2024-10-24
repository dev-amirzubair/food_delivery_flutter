import 'package:flutter/material.dart';
import 'package:food_delivery/app/constants/colors.dart';

class CustomList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final Function(CustomListItem) onPlusPressed;

  CustomList({
    required this.items,
    required this.onPlusPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => Divider(
        color: AppColors.grey.withOpacity(0.1), // Light grey divider
        thickness: 1, // Divider thickness
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          contentPadding: EdgeInsets.zero, // Remove padding between items
          title: Text(
            item['name'],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(item['description']),
          trailing: GestureDetector(
            onTap: () => onPlusPressed(CustomListItem(
                id: item['id'],
                name: item['name'],
                description: item['description'])),
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteLight, // Circle color
              ),
              child: Icon(
                Icons.add,
                color: AppColors.primaryColor, // Plus icon color
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomListItem {
  final int id;
  final String name;
  final String description;

  CustomListItem({
    required this.id,
    required this.name,
    required this.description,
  });
}
