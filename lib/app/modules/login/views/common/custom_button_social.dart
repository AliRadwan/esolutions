import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  final VoidCallback onPressedFn;
  final String image;
  final String title;

  const CustomButtonSocial({
    required this.onPressedFn,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressedFn,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/icons/$image.png',
            fit: BoxFit.contain,
            height: 30,
            width: 30,
          ),
          Text(
            title,
          ),
          Container(width: 70),
        ],
      ),
    );
  }
}
