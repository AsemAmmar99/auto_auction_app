import 'package:auto_auction_app/constants/screens.dart' as screens;
import 'package:auto_auction_app/data/models/car_model.dart';
import 'package:auto_auction_app/presentation/screens/home/home_layout.dart';
import 'package:auto_auction_app/presentation/screens/offered_for_auction/offered_for_auction_screen.dart';
import 'package:auto_auction_app/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../screens/offered_for_auction/offered_car_details.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const SplashScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.homeLayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case screens.offeredCarDetails:
        final CarModel carModel = settings.arguments as CarModel;
        return MaterialPageRoute(builder: (_) => OfferedCarDetails(carModel: carModel,));
      default:
        return null;
    }
  }
}
