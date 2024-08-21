import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_calc/screens/percentage_screen.dart';
import 'package:tax_calc/utils/colors.dart';
import 'package:tax_calc/widgets/custom_button.dart';
import 'package:tax_calc/widgets/custom_text_field.dart';

class BudgetCalculator extends StatefulWidget {
  const BudgetCalculator({super.key});

  @override
  State<BudgetCalculator> createState() => _BudgetCalculatorState();
}

class _BudgetCalculatorState extends State<BudgetCalculator> {
  final key = GlobalKey<FormState>();
  final controller = TextEditingController();
  List<double> budgetList = [];
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
                    "Write your budget and click on add",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.redHatDisplay(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Gap(40.0),
                  CustomTextField(
                    controller: controller,
                    labelText: "Total Income",
                    validator: (value) {
                      if (value == "") {
                        return "Please enter your budget to add";
                      }
                      return null;
                    },
                  ),
                  const Gap(40.0),
                  CustomButton(
                    title: "ADD",
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        budgetList.add(double.parse(controller.text));
                        controller.clear();
                        setState(() {});
                      }
                    },
                  ),
                  const Gap(20.0),
                  Column(
                    children: budgetList
                        .asMap()
                        .map((index, value) => MapEntry(
                              index,
                              Container(
                                margin: const EdgeInsets.only(bottom: 2.0),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.grey,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(index.toString()),
                                    Container(),
                                    Text(value.toString()),
                                  ],
                                ),
                              ),
                            ))
                        .values
                        .toList(),
                  ),
                  const Gap(20.0),
                  if (budgetList.length >= 2)
                    Container(
                      margin: const EdgeInsets.only(bottom: 2.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total"),
                          Container(),
                          Text(budgetList.reduce((a, b) => a + b).toString()),
                        ],
                      ),
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
