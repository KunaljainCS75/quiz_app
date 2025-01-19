import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testline_quiz_app/common/widgets/app_scaffold.dart';
import 'package:testline_quiz_app/common/widgets/appbar_button.dart';
import 'package:testline_quiz_app/common/widgets/quiz_tile.dart';
import 'package:testline_quiz_app/common/widgets/text.dart';
import 'package:testline_quiz_app/features/quiz/controllers/quiz_controller.dart';
import 'package:testline_quiz_app/features/quiz/screens/quiz.dart';
import 'package:testline_quiz_app/utils/sizes.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizController = Get.put(QuizController());
    return AppScaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: quizController.isLoading.value 
          ? Center(
            child: WidgetAnimator(
              atRestEffect: WidgetRestingEffects.rotate(
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 1000)
              ),
              child: Image.asset("assets/images/star.png", height: KSizes.sizeLg)),
          )
          : Column(
            children: [
              const SizedBox(height: KSizes.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppbarButton(
                    icon: CupertinoIcons.chevron_left,
                    onPressed: () {},
                  ),
                  const KText(text: "Levels", weight: FontWeight.w500, size: KSizes.fontSizeLg * 1.2),
                  AppbarButton(
                    icon: Icons.menu,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: KSizes.spaceBtwSections),
              FadeInLeft(
                child: WidgetAnimator(
                  atRestEffect: WidgetRestingEffects.wave(
                    // delay: const Duration(seconds: 2),
                    duration: const Duration(seconds: 5)
                  ),
                  child: Column(
                    children: [
                      QuizTile(
                        onTap: () async {
                          final quiz = await QuizController.instance.getQuiz();
                          quizController.questions.assignAll(quiz.questions);
                          Get.to(() => QuizScreen(quiz: quiz, quizNo: 1));
                        },
                        image: "assets/images/level.png",
                        quizNo: 1,
                      ),
                    ],
                  ),
                ),
              ),       
              const SizedBox(height: KSizes.spaceBtwSections),
              FadeInRight(
                child: WidgetAnimator(
                  atRestEffect: WidgetRestingEffects.wave(
                    // delay: const Duration(seconds: 2),
                    duration: const Duration(seconds: 5)
                  ),
                  child: Column(
                    children: [
                      QuizTile(
                        onTap: () async {
                          final quiz = await QuizController.instance.getQuiz();
                          quizController.questions.assignAll(quiz.questions);
                          Get.to(() => QuizScreen(quiz: quiz, quizNo: 1));
                        },
                        image: "assets/images/level_2.png",
                        quizNo: 2,
                      ),
                    ],
                  ),
                ),
              ),  
              const SizedBox(height: KSizes.spaceBtwSections),
              FadeInLeft(
                child: WidgetAnimator(
                  atRestEffect: WidgetRestingEffects.wave(
                    // delay: const Duration(seconds: 2),
                    duration: const Duration(seconds: 5)
                  ),
                  child: Column(
                    children: [
                      QuizTile(
                        onTap: () async {
                          final quiz = await QuizController.instance.getQuiz();
                          quizController.questions.assignAll(quiz.questions);
                          Get.to(() => QuizScreen(quiz: quiz, quizNo: 1));
                        },
                        image: "assets/images/level_3.png",
                        quizNo: 3,
                      ),
                    ],
                  ),
                ),
              ),     
              const SizedBox(height: KSizes.spaceBtwSections),
              FadeInRight(
                child: WidgetAnimator(
                  atRestEffect: WidgetRestingEffects.wave(
                    // delay: const Duration(seconds: 2),
                    duration: const Duration(seconds: 5)
                  ),
                  child: Column(
                    children: [
                      QuizTile(
                        onTap: () async {
                          final quiz = await QuizController.instance.getQuiz();
                          quizController.questions.assignAll(quiz.questions);
                          Get.to(() => QuizScreen(quiz: quiz, quizNo: 1));
                        },
                        image: "assets/images/level_4.png",
                        quizNo: 4,
                      ),
                    ],
                  ),
                ),
              ),           
            ],
          ),
        ),
      ),
    );
  }
}
