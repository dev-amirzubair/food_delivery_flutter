import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/constants/colors.dart';
import 'package:food_delivery/app/modules/home/history/history_widget.dart';
import 'package:food_delivery/app/modules/home/home/home_widget.dart';
import 'package:food_delivery/app/modules/home/menu/menu_widget.dart';
import 'package:food_delivery/app/modules/home/more/more_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomeTab();
      case 1:
        page = MenuTab();
      case 2:
        page = HistoryWidget();
      case 3:
        page = MoreWidget();
      default:
        throw UnimplementedError('no Weidget for $selectedIndex');
    }
    var currentPage = ColoredBox(
      color: colorScheme.surfaceContainerHigh,
      child: AnimatedSwitcher(
        duration: Duration(microseconds: 200),
        child: page,
      ),
    );

    // print('Hello - ${Text('msg_named').tr(namedArgs: {"lang": "In Dart"})}');

    //  implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: tr('home'),
            icon: Image.asset(
              selectedIndex == 0
                  ? 'assets/imgs/home_active.png'
                  : 'assets/imgs/home.png',
              width: 30,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: tr('menu'),
            icon: Image.asset(
              selectedIndex == 1
                  ? 'assets/imgs/menu_active.png'
                  : 'assets/imgs/menu.png',
              width: 30,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: tr('history'),
            icon: Image.asset(
              selectedIndex == 2
                  ? 'assets/imgs/history_active.png'
                  : 'assets/imgs/history.png',
              width: 30,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: tr('more'),
            icon: Image.asset(
              selectedIndex == 3
                  ? 'assets/imgs/more_active.png'
                  : 'assets/imgs/more.png',
              width: 30,
              height: 30,
            ),
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        selectedItemColor: selectedIndex == 0
            ? AppColors.secondaryColor
            : selectedIndex == 1
                ? AppColors.primaryColor
                : selectedIndex == 2
                    ? AppColors.blue
                    : selectedIndex == 3
                        ? AppColors.magenta
                        : AppColors.white,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
      ),
      body: SafeArea(child: currentPage),
    );
  }
}
