import 'package:flutter/material.dart';

class AppBackgroundWidget extends StatelessWidget {
  final String image;
  const AppBackgroundWidget({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SizedBox(
        height: double.infinity,
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
