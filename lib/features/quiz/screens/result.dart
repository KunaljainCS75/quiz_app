import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testline_quiz_app/common/widgets/app_scaffold.dart';
import 'package:testline_quiz_app/common/widgets/button.dart';
import 'package:testline_quiz_app/common/widgets/text.dart';
import 'package:testline_quiz_app/features/quiz/models/quiz.dart';
import 'package:testline_quiz_app/features/quiz/screens/home.dart';
import 'package:testline_quiz_app/utils/sizes.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key, 
    required this.marks, 
    required this.correct, 
    required this.wrong, 
    required this.notAttempted,
    required this.time,
    required this.quiz
  });

  final double marks;
  final int correct;
  final int wrong;
  final int notAttempted;
  final int time;
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    final totalMarks = quiz.totalQuestions * quiz.correctAnswerMarks;
    final minutes = (time ~/ 60).toString().padLeft(2, '0');
    final seconds = (time % 60).toString().padLeft(2, '0');
    
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(KSizes.spaceBtwItems),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
              border: Border.all(color: Colors.white30),
              color: Colors.black38
            ),
            child: Column(
              children: [
                WidgetAnimator(
                  atRestEffect: WidgetRestingEffects.swing(
                    effectStrength: 3,
                    duration: const Duration(seconds: 5)
                  ),
                  child: Image.asset("assets/images/trophy.png", height: KSizes.sizeLg)),
                const KText(
                  text: "Congratulations!",
                  size: KSizes.fontSizeLg * 1.5,
                ),
                KText(
                  text: "${(marks * 100) ~/ totalMarks}% Score",
                  size: KSizes.fontSizeLg * 2,
                  weight: FontWeight.w800,
                  color: Colors.greenAccent,
                ),
                const KText(
                  text: "Quiz completed successfully",
                  size: KSizes.fontSizeLg,
                  weight: FontWeight.w800,
                  color: Colors.white,
                ),
                const SizedBox(height: KSizes.spaceBtwItems),
                KButton(
                  onTap: () {}, 
                  text: "Summary",
                  textColor: Colors.deepOrange.shade300,
                  backgroundColor: Colors.transparent,
                  borderColor: Colors.transparent,
                  size: KSizes.fontSizeMd * 1.5,
                  isIcon: true,
                  icon: const Icon(Icons.workspace_premium, color: Colors.white),
                ),
                const SizedBox(height: KSizes.spaceBtwItems),
                KText(
                  text: "Questions Attempted: $notAttempted / ${quiz.totalQuestions}",
                  size: KSizes.fontSizeLg,
                  weight: FontWeight.w500,
                ),
                KText(
                  text: "Correct Attempts: $correct",
                  size: KSizes.fontSizeLg,
                  weight: FontWeight.w500,
                  color: Colors.blue.shade300,
                ),
                KText(
                  text: "Incorrect Attempts: $wrong",
                  size: KSizes.fontSizeLg,
                  weight: FontWeight.w500,
                  color: Colors.red,
                ),
                KText(
                  text: "Not Attempted: $notAttempted",
                  size: KSizes.fontSizeLg,
                  weight: FontWeight.w500,
                ),
                KText(
                  text: "Marks Scored: $marks / $totalMarks",
                  size: KSizes.fontSizeLg,
                  weight: FontWeight.w700,
                  color: Colors.yellow,
                ),
                // const SizedBox(height: KSizes.spaceBtwItems),
                KText(
                  text: "Time Taken: $minutes:$seconds",
                  size: KSizes.fontSizeLg,
                  weight: FontWeight.w700,
                  color: Colors.green.shade300,
                ),
             ],
            ),
          ),
          const SizedBox(height: KSizes.spaceBtwSections),
          KButton(
            onTap: () => Get.offAll(() => const HomeScreen()), 
            text: "Finish",
            size: KSizes.fontSizeLg * 2,
            backgroundColor: Colors.pink,
            borderColor: Colors.white30,
          )
        ],
      ),
    );
  }
}