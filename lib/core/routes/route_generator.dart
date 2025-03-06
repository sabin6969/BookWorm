import 'package:bookworm/core/routes/app_routes_name.dart';
import 'package:bookworm/view/fall_back_view.dart';
import 'package:bookworm/view/home/home_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.homeView:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => FallBackView(),
        );
    }
  }
}
