import 'package:bookworm/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedBottomNavItem extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final int activateIndex;
  const AnimatedBottomNavItem({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.activateIndex,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        border: currentIndex == activateIndex
            ? Border(
                top: BorderSide(
                  color: context.read<ThemeViewModel>().isDarkTheme
                      ? Colors.white
                      : Colors.black,
                  width: 2,
                ),
              )
            : null,
      ),
      duration: Durations.short3,
      child: child,
    );
  }
}
