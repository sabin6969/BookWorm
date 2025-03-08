import 'package:bookworm/core/routes/route_generator.dart';
import 'package:bookworm/repository/book_repository.dart';
import 'package:bookworm/services/shared_preference_services.dart';
import 'package:bookworm/view/dashboard/dashboard_view.dart';
import 'package:bookworm/view/home/home_view.dart';
import 'package:bookworm/view_model/book_view_model.dart';
import 'package:bookworm/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // ensuring WidgetsBinding is initalized before running a app
  await SharedPreferenceServices.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeViewModel(),
        )
      ],
      child: Consumer<ThemeViewModel>(
        builder: (context, value, child) {
          return MaterialApp(
            title: "Book Worm",
            theme: value.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
            home: DashboardView(),
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}
