import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/cart/cart_widget.dart';
import 'package:food_delivery/app/modules/chat/design/chat_widget.dart';
import 'package:food_delivery/app/modules/home/dhome_widget.dart';
import 'package:food_delivery/app/modules/home/home/viewmodel.dart';
import 'package:food_delivery/app/modules/login/login_widget.dart';
import 'package:food_delivery/app/modules/login/signin/viewmodel.dart';
import 'package:food_delivery/app/modules/productDetails/product_widget.dart';
import 'package:food_delivery/app/modules/productDetails/viewModal.dart';
import 'package:food_delivery/app/modules/profile/map/map_widget.dart';
import 'package:food_delivery/app/modules/profile/map/viewModal.dart';
import 'package:food_delivery/app/modules/profile/profile_widget.dart';
import 'package:food_delivery/app/modules/profile/viewModal.dart';
import 'package:food_delivery/app/modules/showMore/show_more_widget.dart';
import 'package:food_delivery/app/modules/splash/splash_widget.dart';
import 'package:provider/provider.dart';

class RouteName {
  static const splashScreen = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const profile = '/profile';
  static const map = '/map';
  static const productInfo = '/productInfo';
  static const showMore = '/showMore';
  static const cart = '/cart';
  static const chat = '/chat';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case RouteName.splashScreen:
        page = SplashScreen();
        break;
      case RouteName.login:
        page = LoginPage();
        break;
      case RouteName.register:
        page = LoginPage();
        break;
      case RouteName.home:
        page = ChangeNotifierProvider(
            create: (context) => HomeViewModel(), child: HomePage());
        break;
      case RouteName.profile:
        page = ChangeNotifierProvider(
            create: (context) => ProfileViewModal(), child: Profile());
        break;
      case RouteName.map:
        page = ChangeNotifierProvider(
            create: (context) => MapViewModal(), child: MapWidget());
        break;
      case RouteName.showMore:
        page = ShowMoreWidget();
        break;
      case RouteName.cart:
        page = CartWidget();
        break;
      case RouteName.chat:
        page = ChatScreen();
        break;
      case RouteName.productInfo:
        final args = settings.arguments as Map;
        final id = args["id"];
        page = ChangeNotifierProvider(
          create: (context) => ProductDetailsViewModal(),
          child: ProductInfoWidget(
            id: id,
          ),
        );
        break;
      default:
        page = Scaffold(
          body: Center(
            child: Text('No Route Found!'),
          ),
        );
        break;
    }
    return MaterialPageRoute(builder: (context) => page);
  }
}
