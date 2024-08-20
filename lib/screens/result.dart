import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_calc/utils/colors.dart';

class ResultScreen extends StatelessWidget {
  final String remainingAmout;
  final String totalTax;
  final String totalIncome;
  const ResultScreen({super.key, required this.remainingAmout, required this.totalTax, required this.totalIncome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "$totalTax Total Tax Amount",
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
                          totalIncome,
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
                          "Tax Amount",
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
                          totalTax,
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
                          "Remaining Amount",
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
                          remainingAmout,
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
