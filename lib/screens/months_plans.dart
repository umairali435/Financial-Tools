import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_calc/screens/installment_result.dart';
import 'package:tax_calc/widgets/custom_button.dart';
import 'package:tax_calc/widgets/custom_text_field.dart';

class MonthsPlanScreen extends StatefulWidget {
  final String totalPrice;
  const MonthsPlanScreen({super.key, required this.totalPrice});

  @override
  State<MonthsPlanScreen> createState() => _MonthsPlanScreenState();
}

class _MonthsPlanScreenState extends State<MonthsPlanScreen> {
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
                    "What is total months plan of the product ?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.redHatDisplay(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Gap(40.0),
                  CustomTextField(
                    controller: controller,
                    labelText: "Total Months",
                    validator: (value) {
                      if (value == "") {
                        return "Please enter your total months";
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
                            builder: (context) => InsallmentResultScreen(
                              totalPrice: widget.totalPrice,
                              totalMonths: controller.text,
                              installmentAmout: (double.parse(widget.totalPrice) ~/ double.parse(controller.text)).toString(),
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
