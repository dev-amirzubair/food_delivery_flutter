import 'package:flutter/widgets.dart';
import 'package:food_delivery/app/constants/colors.dart';

class CusotmBodyWidget extends StatelessWidget {
  final Widget childern;

  const CusotmBodyWidget({
    required this.childern,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 240, 240, 240),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                )
              ]),
          child: childern,
        ),
      ),
    );
  }
}
