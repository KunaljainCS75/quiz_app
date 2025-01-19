
import 'package:flutter/material.dart';
import 'package:testline_quiz_app/common/widgets/text.dart';
import 'package:testline_quiz_app/utils/sizes.dart';

class QuizTile extends StatelessWidget {
  const QuizTile({
    super.key, 
    required this.image, 
    required this.quizNo,
    required this.onTap
  });

  final String image;
  final int quizNo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(image, height: KSizes.sizeMd),
          KText(
            text: "Quiz\n0$quizNo", 
            textAlign: TextAlign.center, 
            size: KSizes.fontSizeLg * 1.5,
            weight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}

