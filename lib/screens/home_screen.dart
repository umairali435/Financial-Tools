import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_calc/screens/percentage_screen.dart';
import 'package:tax_calc/widgets/custom_button.dart';
import 'package:tax_calc/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    "How much is your Monthly Gross Income",
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
                        return "Please enter your total Income";
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
                            builder: (context) => PercentageScreen(
                              totalIncome: controller.text,
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
