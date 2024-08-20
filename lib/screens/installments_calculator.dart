import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_calc/screens/months_plans.dart';
import 'package:tax_calc/widgets/custom_button.dart';
import 'package:tax_calc/widgets/custom_text_field.dart';

class InsallmentsCalculator extends StatefulWidget {
  const InsallmentsCalculator({super.key});

  @override
  State<InsallmentsCalculator> createState() => _InsallmentsCalculatorState();
}

class _InsallmentsCalculatorState extends State<InsallmentsCalculator> {
  final key = GlobalKey<FormState>();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(20.0),
                  Text(
                    "What is total price of the product ?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.redHatDisplay(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Gap(40.0),
                  CustomTextField(
                    controller: controller,
                    labelText: "Total Price",
                    validator: (value) {
                      if (value == "") {
                        return "Please enter your total price";
                      }
                      return null;
                    },
                  ),
                  const Gap(40.0),
                  CustomButton(
                    title: "NEXT",
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MonthsPlanScreen(
                              totalPrice: controller.text,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
