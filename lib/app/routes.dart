import 'package:flutter/material.dart';
import 'package:pet_store/presentation/screens/details/detail_main.dart';
import 'package:pet_store/presentation/screens/history/history_main.dart';
import 'package:pet_store/presentation/screens/home/home_main.dart';
import 'package:pet_store/presentation/screens/liked/liked_main.dart';
import 'package:pet_store/presentation/screens/search/search_main.dart';
import 'package:pet_store/presentation/screens/splash/splash_main.dart';

// make it a class

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => const MainSplash(),
        );
      case Home.id:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case AdoptionHistoryScreen.id:
        return MaterialPageRoute(
          builder: (context) => const AdoptionHistoryScreen(),
        );
      case PetDetailPage.id:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => PetDetailPage(
            pet: arguments["pet"],
            color: arguments['color'],
          ),
        );
      case SearchPage.id:
        return MaterialPageRoute(
          builder: (context) => SearchPage(),
        );
      case LikedScreen.id:
        return MaterialPageRoute(
          builder: (context) => const LikedScreen(),
        );
      default:
        return null;
    }
  }
}
