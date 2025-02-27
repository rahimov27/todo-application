import 'package:flutter/material.dart';

class AppBackgroundWidget extends StatelessWidget {
  const AppBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SizedBox(
        height: double.infinity,
        child: Image.asset("assets/wallpaper.jpg", fit: BoxFit.cover),
      ),
    );
  }
}
