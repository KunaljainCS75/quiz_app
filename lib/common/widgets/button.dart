import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testline_quiz_app/common/widgets/text.dart';
import 'package:testline_quiz_app/utils/colors.dart';
import 'package:testline_quiz_app/utils/sizes.dart';
class KButton extends StatelessWidget {
  const KButton({
    super.key,
    required this.onTap,
    required this.text,
    this.size = KSizes.fontSizeMd,
    this.backgroundColor = Colors.white12,
    this.textColor = KColors.textWhite,
    this.borderColor = Colors.white30,
    this.icon = const Icon(Icons.quiz, color: Colors.white54, weight: 5),
    this.isIcon = false
  });

  final VoidCallback onTap;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color borderColor;
  final Widget icon;
  final bool isIcon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(KSizes.cardRadiusMd), 
          side: BorderSide(color: borderColor, width: 2),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KSizes.spaceBtwItems, vertical: KSizes.spaceBtwItems / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isIcon)...[
              icon,
              const SizedBox(width: KSizes.spaceBtwItems / 2)
            ],
            KText(textAlign: TextAlign.justify, text: text, color: textColor, weight: FontWeight.w500, size: size, maxlines: 50),
          ],
        ),
      )
    );
  }
}
