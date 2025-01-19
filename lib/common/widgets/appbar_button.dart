import 'package:flutter/material.dart';
import 'package:testline_quiz_app/utils/colors.dart';

class AppbarButton extends StatelessWidget {
  const AppbarButton({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        backgroundColor: Colors.deepPurple
      ), 
      child: Icon(icon, color: KColors.white,),
    );
  }
}