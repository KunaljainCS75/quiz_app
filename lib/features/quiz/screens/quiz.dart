import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testline_quiz_app/common/widgets/app_scaffold.dart';
import 'package:testline_quiz_app/common/widgets/appbar_button.dart';
import 'package:testline_quiz_app/common/widgets/button.dart';
import 'package:testline_quiz_app/common/widgets/text.dart';
import 'package:testline_quiz_app/common/widgets/value_label.dart';
import 'package:testline_quiz_app/features/quiz/screens/question.dart';
import 'package:testline_quiz_app/utils/colors.dart';
import 'package:testline_quiz_app/utils/sizes.dart';
import '../models/quiz.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({
    super.key, 
    required this.quiz, 
    required this.quizNo
  });
  final Quiz quiz;
  final int quizNo;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: KSizes.spaceBtwSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: KText(
                  textAlign: TextAlign.center,
                  text: "Quiz - 0$quizNo", 
                  weight: FontWeight.w500, 
                  size: KSizes.fontSizeLg * 2.5
                )
              ),
              AppbarButton(
                icon: Icons.arrow_back_ios_new,
                onPressed: () => Get.back(),
              ),
            ],
          ),
          const SizedBox(height: KSizes.spaceBtwSections / 2),
          KText(
              maxlines: 2,
              text: quiz.title, 
              color: Colors.deepOrange,
              weight: FontWeight.w500, 
              size: KSizes.fontSizeLg * 1.5 
          ),
          KText(
            maxlines: 2,
            text: quiz.topic, 
            color: Colors.yellow,
            weight: FontWeight.w500, 
            size: KSizes.fontSizeLg 
          ),
          const SizedBox(height: KSizes.spaceBtwItems),
          ValueLabel(
            label: "Total Questions",
            value: quiz.totalQuestions,
            valueBgColor: Colors.yellow.shade200,
          ),
          const SizedBox(height: KSizes.spaceBtwItems),
          ValueLabel(
            label: "Correct Answer",
            value: quiz.correctAnswerMarks,
            valueBgColor: Colors.greenAccent,
          ),
          const SizedBox(height: KSizes.spaceBtwItems),
          ValueLabel(
            label: "Incorrect Answer",
            value: quiz.wrongAnswerMarks,
            valueBgColor: Colors.redAccent,
          ),
          const SizedBox(height: KSizes.spaceBtwSections),
          KButton(
            onTap: () {}, 
            text: "Time = ${(2 * quiz.totalQuestions)} minutes",
            isIcon: true,
            icon: const Icon(CupertinoIcons.timer, color: KColors.white,),
          ),
          const Spacer(),
          KButton(
            onTap: () => Get.to(() => QuestionScreen(quiz: quiz, quizNo: quizNo.toString())), 
            backgroundColor: Colors.blue,
            text: "Start Quiz",
            size: KSizes.fontSizeLg * 1.5,
          ),
          const SizedBox(height: KSizes.spaceBtwItems),
        ],
      ),
    );
  }
}

