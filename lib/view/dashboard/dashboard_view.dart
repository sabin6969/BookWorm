import 'package:bookworm/repository/book_repository.dart';
import 'package:bookworm/view/home/home_view.dart';
import 'package:bookworm/view_model/book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/widgets/animated_bottom_nav_item.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late ValueNotifier<int> _currentIndex;

  final List<Widget> _pages = [
    ChangeNotifierProvider(
      lazy: true,
      create: (context) => BookViewModel(
        bookRepository: BookRepository(),
      ),
      child: HomeView(),
    ),
    Center(
      child: Text("Reading List!"),
    ),
    Center(
      child: Text("Profile View"),
    )
  ];

  @override
  void initState() {
    _currentIndex = ValueNotifier(0); // inital 0th page
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
