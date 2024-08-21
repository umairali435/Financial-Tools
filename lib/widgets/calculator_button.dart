import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_calc/utils/colors.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int? fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const CalculatorButton({
    Key? key,
    required this.text,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          callback(text);
        },
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.only(bottom: 5.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                  fontSize: 20.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
