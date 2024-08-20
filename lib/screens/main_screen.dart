import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:tax_calc/screens/drawer_screen.dart';
import 'package:tax_calc/screens/home_screen.dart';
import 'package:tax_calc/screens/installments_calculator.dart';
import 'package:tax_calc/utils/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Financial Tools",
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: Container(
                height: 100.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7B5CA),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Icon(
                        LucideIcons.coins,
                        color: AppColors.whiteColor,
                        size: 50.0,
                      ),
                    ),
                    Gap(20.0),
                    Text(
                      "Tax Calculator(GST)",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(40.0),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InsallmentsCalculator(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC6C6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Icon(
                        LucideIcons.heartHandshake,
                        color: AppColors.whiteColor,
                        size: 50.0,
                      ),
                    ),
                    Gap(20.0),
                    Text(
                      "Insallments Calculator",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: AppColors.whiteColor,
                      ),
                    ),
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
