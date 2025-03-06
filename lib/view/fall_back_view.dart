import 'package:flutter/material.dart';

class FallBackView extends StatefulWidget {
  const FallBackView({super.key});

  @override
  State<FallBackView> createState() => _FallBackViewState();
}

class _FallBackViewState extends State<FallBackView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("OOPs i am LOST!"),
      ),
    );
  }
}
