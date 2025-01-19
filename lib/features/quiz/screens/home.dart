import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testline_quiz_app/common/widgets/app_scaffold.dart';
import 'package:testline_quiz_app/common/widgets/button.dart';
import 'package:testline_quiz_app/common/widgets/text.dart';
import 'package:testline_quiz_app/features/quiz/screens/levels.dart';
import 'package:testline_quiz_app/utils/colors.dart';
import 'package:testline_quiz_app/utils/sizes.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShakeY(
              infinite: true,
              duration: const Duration(seconds: 10),
              child: Image.asset("assets/images/bulb.png", height: KSizes.defaultSpace * 8),
            ),
            const SizedBox(height: KSizes.spaceBtwItems),
            const KText(
              text: "TestLine Quiz",
              size: KSizes.fontSizeLg * 1.8,
              weight: FontWeight.w600,
            ),
            // const SizedBox(height: KSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KSizes.spaceBtwItems * 2, vertical: KSizes.spaceBtwItems),
              child: WidgetAnimator(
                atRestEffect: WidgetRestingEffects.size(duration: const Duration(seconds: 5)),
                child: KButton(
                  onTap: () => Get.to(() => const LevelsScreen()), 
                  text: "Play Now",
                  size: KSizes.fontSizeLg * 1.8,
                  borderColor: Colors.pink,
                  textColor: KColors.textWhite,
                  backgroundColor: Colors.pink,
                ),
              ),
            )
          ],
        )
    );
  }
}