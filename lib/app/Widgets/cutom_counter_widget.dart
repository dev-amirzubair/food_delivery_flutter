import 'package:flutter/material.dart';
import 'package:food_delivery/app/constants/colors.dart';

class CounterWidget extends StatefulWidget {
  int counter = 1;
  int maxCount = 0;
  final Function(int) onQuantityChanged;

  CounterWidget({
    required this.counter,
    this.maxCount = 0,
    required this.onQuantityChanged,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    int currentCount = widget.counter;
    int maxCount = widget.maxCount;
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (currentCount > 1) {
                currentCount--;
                widget.counter = currentCount;
                widget.onQuantityChanged(currentCount);
              }
            });
          },
          child: Icon(
            Icons.minimize_rounded,
            color: AppColors.red,
          ),
        ),
      ),
      Text(' $currentCount '),
      GestureDetector(
        onTap: () {
          setState(() {
            if (maxCount > 0 && currentCount < maxCount) {
              currentCount++;
            } else if (maxCount == 0) {
              currentCount++;
            }
            widget.counter = currentCount;
            widget.onQuantityChanged(currentCount);
          });
        },
        child: Icon(
          Icons.add,
          color: AppColors.red,
        ),
      ),
    ]);
  }
}
