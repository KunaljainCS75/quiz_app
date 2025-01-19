import 'package:flutter/material.dart';
import 'package:testline_quiz_app/common/widgets/text.dart';
import 'package:testline_quiz_app/utils/sizes.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key, 
    this.bgColor = Colors.yellow, 
    required this.value,
    this.size,
    this.textColor = Colors.black
  });

  final Color bgColor;
  final Color textColor;
  final String value;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: KSizes.spaceBtwItems / 3,
          vertical: KSizes.spaceBtwItems / 4
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(KSizes.cardRadiusLg)
      ),
      child: KText(
        color: textColor,
        size: size,
        weight: FontWeight.bold,
        text: value
      ),
    );
  }
}