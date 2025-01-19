// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testline_quiz_app/common/widgets/app_scaffold.dart';
import 'package:testline_quiz_app/common/widgets/appbar_button.dart';
import 'package:testline_quiz_app/common/widgets/button.dart';
import 'package:testline_quiz_app/common/widgets/rounded_container.dart';
import 'package:testline_quiz_app/common/widgets/text.dart';
import 'package:testline_quiz_app/features/quiz/controllers/quiz_controller.dart';
import 'package:testline_quiz_app/features/quiz/models/quiz.dart';
import 'package:testline_quiz_app/utils/colors.dart';
import 'package:testline_quiz_app/utils/sizes.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key, required this.quiz, required this.quizNo});

  final Quiz quiz;
  final String quizNo;

  @override
  Widget build(BuildContext context) {
    final quizController = QuizController.instance;

    // Question and Options attributes
    final optSerial = [" A ", " B ", " C ", " D "]; // at most 4 options
    RxInt qno = 1.obs;
    final RxList<int> answersIndex = List.filled(quiz.totalQuestions, -1).obs;

    // Timer Logic
    RxString minutes = "00".obs;
    RxString seconds = "00".obs;
    Rx<int> time = (quiz.totalQuestions * 2 * 60).obs;
    int timePassed = 0;
    int totalTime = time.value;
    Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time > 0) {
        time.value--;
        timePassed++;
        minutes.value = (time ~/ 60).toString().padLeft(2, '0');
        seconds.value = (time % 60).toString().padLeft(2, '0');
      } else {
        // Submit automatically 
        timer.cancel();
        quizController.calculateResult(answersIndex, quiz,timePassed); 
      }
    });

    // UI Logic
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: KSizes.spaceBtwSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppbarButton(
                icon: Icons.more_vert,
                onPressed: () => Get.back(),
              ),
              Flexible(
                child: KText(
                  textAlign: TextAlign.center,
                  text: "Quiz - 0$quizNo", 
                  // maxlines: 1,
                  weight: FontWeight.w500, 
                  size: KSizes.fontSizeLg * 2
                )
              ),
              AppbarButton(
                icon: Icons.close,
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
            weight: FontWeight.w500, 
            size: KSizes.fontSizeLg 
          ),
          const SizedBox(height: KSizes.spaceBtwItems),
          Obx(
            () => LinearPercentIndicator(
              padding: const EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width - 2 * KSizes.defaultSpace,
              lineHeight: 50,
              progressColor: Colors.blue,
              backgroundColor: Colors.black38,
              barRadius: const Radius.circular(KSizes.cardRadiusSm),
              percent: (timePassed / totalTime),
              center: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(CupertinoIcons.timer, color: Colors.white),
                  KText(text: " $minutes:$seconds", size: KSizes.fontSizeLg, weight: FontWeight.w600,)
                ],
              ),
            ),
          ),
          const SizedBox(height: KSizes.spaceBtwItems),
           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => KText(
                    text:"Question ${qno.value} of ${quiz.totalQuestions}",
                    size: KSizes.fontSizeMd * 1.5,
                    weight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: KSizes.spaceBtwItems / 3),
               
                
                const SizedBox(height: KSizes.spaceBtwItems),
                SizedBox(
                  height: 400,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Obx(
                           () => KText(
                            text: quiz.questions[qno.value - 1].question,
                            maxlines: 50,
                            textAlign: TextAlign.justify,
                            color: Colors.yellow,
                            size: KSizes.fontSizeSm * 1.5,
                                                   ),
                         ),
                        const SizedBox(height: KSizes.spaceBtwItems),
                        const KText(text: " Options"),
                        const SizedBox(height: KSizes.spaceBtwItems),
                        Obx(
                          () => ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            // scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.all(0),
                            itemCount: quizController.questions[qno.value - 1].options.length,
                            separatorBuilder: (context, index) => const SizedBox(height: KSizes.spaceBtwItems) ,
                            itemBuilder: (context, index) {
                        
                              final option = quizController.questions[qno.value - 1].options[index];

                              return InkWell(
                                onTap: () {
                                  if (answersIndex[qno.value - 1] == index) {
                                    // same option selected then 
                                    // un-select it
                                    answersIndex[qno.value - 1] = -1;
                                    return;
                                  }
                                  answersIndex[qno.value - 1] = index;
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: KSizes.spaceBtwItems,
                                      vertical: KSizes.spaceBtwItems / 2,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white38),
                                      borderRadius: BorderRadius.circular(KSizes.cardRadiusSm)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            RoundedContainer(
                                              value: optSerial[index],
                                              size: KSizes.fontSizeLg * 1.2,
                                              bgColor: Colors.purpleAccent,
                                              textColor: KColors.textWhite,
                                            ),
                                            const SizedBox(width: KSizes.spaceBtwItems),
                                            KText(
                                              textAlign: TextAlign.justify,
                                              text: option.option,
                                              maxlines: 4,
                                              size: KSizes.fontSizeMd,
                                            )
                                          ],
                                        ),
                                          Obx(
                                            () => answersIndex[qno.value - 1] == index
                                                ? const Icon(Icons.check_circle, color: KColors.white)
                                                : const SizedBox(),
                                          ),
                                      ],
                                    ),
                                  ),
                                
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          
          const Spacer(),

          // Next and Previous Buttons
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (qno.value > 1)
                  KButton(
                    onTap: () => qno.value--,
                    backgroundColor: Colors.blueAccent,
                    text: "Prev",
                    size: KSizes.fontSizeLg * 1.5,
                    isIcon: true,
                    icon: const Icon(CupertinoIcons.chevron_left, color: Colors.white),
                  ),
                const Spacer(),
                KButton(
                   onTap: () {
                    if (qno < quiz.totalQuestions) {
                      qno.value++;
                    } else {
                      // Confirmation dialog
                      Get.dialog(
                        AlertDialog(
                          title: const Text("Confirm Submission"),
                          content: const Text("Are you sure you want to submit?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back(); // Close the dialog
                              },
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                timer.cancel();
                                quizController.calculateResult(answersIndex, quiz, timePassed);
                                Get.snackbar(
                                  "Success",
                                  "Submission successfully completed.",
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: Colors.blue,
                                  colorText: KColors.white,
                                  icon: const Icon(Icons.verified, color: KColors.white,)
                                );
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                        barrierDismissible: false, // Prevent closing the dialog by tapping outside
                      );
                    }
                  },
                  backgroundColor: Colors.greenAccent.shade400,
                  text: qno.value == quiz.totalQuestions ? "Submit" : "Next",
                  size: KSizes.fontSizeLg * 1.5,
                  isIcon: true,
                  icon: const Icon(CupertinoIcons.chevron_right, color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(height: KSizes.spaceBtwItems),
        ],
      ),
    );
  }
}