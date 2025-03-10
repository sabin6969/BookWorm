import 'package:bookworm/view/home/home_view.dart';
import 'package:bookworm/view/profile/profile_view.dart';
import 'package:bookworm/view/reading_list/reading_list_view.dart';
import 'package:flutter/material.dart';

import '../home/widgets/animated_bottom_nav_item.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late ValueNotifier<int> _currentIndex;

  final List<Widget> _pages = [
    HomeView(),
    ReadingList(),
    ProfileView(),
  ];

  @override
  void initState() {
    _currentIndex = ValueNotifier(0); // initial 0th page
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
      body: ValueListenableBuilder<int>(
        valueListenable: _currentIndex,
        builder: (context, value, child) {
          return _pages[_currentIndex.value];
        },
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
                label: "Reading List",
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
