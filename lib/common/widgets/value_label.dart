import 'package:flutter/material.dart';
import 'package:testline_quiz_app/common/widgets/rounded_container.dart';
import 'package:testline_quiz_app/common/widgets/text.dart';
import 'package:testline_quiz_app/utils/colors.dart';
import 'package:testline_quiz_app/utils/sizes.dart';

class ValueLabel extends StatelessWidget {
  const ValueLabel({
    super.key,
    required this.label, 
    this.value, 
    this.valueBgColor = Colors.yellow,
  });

  final String label;
  final dynamic value;
  final Color valueBgColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.radio_button_checked, color: KColors.white),
        KText(
          text: " $label:  ", 
          weight: FontWeight.w500, 
          size: KSizes.fontSizeMd
        ),
        RoundedContainer(
          bgColor: valueBgColor,
          value: value.toString()
        )
      ],
    );
  }
}

