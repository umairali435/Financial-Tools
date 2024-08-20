import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_calc/utils/colors.dart';

class InsallmentResultScreen extends StatelessWidget {
  final String totalMonths;
  final String totalPrice;
  final String installmentAmout;
  const InsallmentResultScreen({
    super.key,
    required this.totalMonths,
    required this.totalPrice,
    required this.installmentAmout,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "$installmentAmout Total Installment Amount",
              textAlign: TextAlign.center,
              style: GoogleFonts.redHatDisplay(
                fontSize: 52.0,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 300.0,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Amount",
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        const Text(
                          ":",
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          totalPrice,
                          style: const TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Months",
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        const Text(
                          ":",
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          totalMonths,
                          style: const TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Installment Amount",
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        const Text(
                          ":",
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          installmentAmout,
                          style: const TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
