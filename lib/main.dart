import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_delivery/app/constants/colors.dart';
import 'package:food_delivery/app/routes/routes.dart';
import 'package:food_delivery/app/modules/cart/viewModel.dart';
import 'package:food_delivery/app/modules/home/history/viewmodel.dart';
import 'package:food_delivery/app/modules/home/menu/viewmodel.dart';
import 'package:food_delivery/app/modules/home/more/viewmodel.dart';
import 'package:food_delivery/app/modules/login/signin/viewmodel.dart';
import 'package:food_delivery/app/modules/login/signup/viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ur')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInViewModel()),
        ChangeNotifierProvider(create: (_) => SignUpViewModel()),
        ChangeNotifierProvider(create: (_) => MenuViewModal()),
        ChangeNotifierProvider(create: (_) => HistoryViewModal()),
        ChangeNotifierProvider(create: (_) => MoreViewModal()),
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // home: SplashScreen(),
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
