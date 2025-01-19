import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testline_quiz_app/utils/colors.dart';

class KText extends StatelessWidget {
  const KText({
    super.key, 
    required this.text, 
    this.color = KColors.textWhite, 
    this.weight, 
    this.size, 
    this.textAlign,
    this.maxlines
  });

  final String text;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  final TextAlign? textAlign;
  final int? maxlines;

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: textAlign,
      style: GoogleFonts.lexend(
        fontSize: size, 
        fontWeight: weight,
        color: color,
        ),
        maxLines: maxlines,
        overflow: TextOverflow.ellipsis,
    );
  }
}