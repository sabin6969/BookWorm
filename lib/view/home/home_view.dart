import 'package:bookworm/view/home/widgets/animated_bottom_nav_item.dart';
import 'package:bookworm/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ValueNotifier<int> _currentIndex;

  @override
  void initState() {
    _currentIndex = ValueNotifier(0);
    super.initState();
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Book Worm",
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeViewModel>().toogleTheme();
            },
            icon: Icon(
              context.read<ThemeViewModel>().isDarkTheme
                  ? Icons.sunny
                  : Icons.dark_mode,
            ),
          )
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder: (context, value, child) {
          return BottomNavigationBar(
            currentIndex: _currentIndex.value,
            onTap: (index) => _currentIndex.value = index,
            items: [
              BottomNavigationBarItem(
                icon: AnimatedBottomNavItem(
                  currentIndex: _currentIndex.value,
                  activateIndex: 0,
                  child: Icon(
                    Icons.home_outlined,
                  ),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: AnimatedBottomNavItem(
                  currentIndex: _currentIndex.value,
                  activateIndex: 1,
                  child: Icon(
                    Icons.book_outlined,
                  ),
                ),
                label: "Book",
              ),
              BottomNavigationBarItem(
                icon: AnimatedBottomNavItem(
                  currentIndex: _currentIndex.value,
                  activateIndex: 2,
                  child: Icon(
                    Icons.person_outline,
                  ),
                ),
                label: "Profile",
              )
            ],
          );
        },
      ),
    );
  }
}
