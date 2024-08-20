import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:tax_calc/screens/result.dart';
import 'package:tax_calc/utils/colors.dart';
import 'package:tax_calc/widgets/custom_button.dart';

class PercentageScreen extends StatefulWidget {
  final String totalIncome;
  const PercentageScreen({super.key, required this.totalIncome});

  @override
  State<PercentageScreen> createState() => _PercentageScreenState();
}

class _PercentageScreenState extends State<PercentageScreen> {
  double _value = 7.0;
  double discountprice = 0.0;
  bool isShowDropDown = false;
  final List<double> discountList = [
    3,
    5,
    7,
    8,
    10,
    12,
    15,
    18,
    20,
    22,
    28,
    32,
  ];
  _calculateRemaining(totalprice, discount) {
    totalprice = double.parse(totalprice);
    discount = double.parse(discount);
    double cal = (discount * totalprice) / 100;
    discountprice = totalprice - cal;
    return discountprice;
  }

  double _calculateTotalTax(totalprice, discountprice) {
    totalprice = double.parse(totalprice);
    double saved = totalprice - discountprice;
    return saved;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(20.0),
                Text(
                  "How much is your GST rate",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.redHatDisplay(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Gap(40.0),
                SizedBox(
                  height: 150.0,
                  child: Card(
                    child: Column(
                      children: [
                        Text(
                          "${_value.toInt()}%",
                          style: GoogleFonts.robotoCondensed(
                            fontWeight: FontWeight.w900,
                            fontSize: 50.0,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CupertinoSlider(
                                min: 0,
                                max: 100,
                                activeColor: AppColors.primaryColor,
                                value: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(40.0),
                CustomDropDownField(
                  onTap: () {
                    setState(() {
                      isShowDropDown = !isShowDropDown;
                    });
                  },
                  title: "Percentage",
                  height: 50.0,
                  width: double.infinity,
                ),
                isShowDropDown
                    ? Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          spacing: 5.0,
                          runSpacing: 10.0,
                          children: discountList
                              .map((e) => TagDiscount(
                                    discount: e.toInt().toString(),
                                    color: _value.toInt() == e.toInt() ? AppColors.primaryColor : AppColors.whiteColor,
                                    onPressed: () {
                                      _value = e;
                                      setState(() {});
                                    },
                                  ))
                              .toList(),
                        ),
                      )
                    : Container(),
                const Gap(40.0),
                CustomButton(
                  title: "CALCULATE",
                  onPressed: () {
                    final double remaining = _calculateRemaining(widget.totalIncome, _value.toString());
                    final tax = _calculateTotalTax(widget.totalIncome, discountprice);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          totalTax: tax.toInt().toString(),
                          remainingAmout: remaining.toInt().toString(),
                          totalIncome: widget.totalIncome,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TagDiscount extends StatelessWidget {
  final VoidCallback onPressed;
  final String discount;
  final Color color;
  const TagDiscount({
    super.key,
    required this.discount,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          "$discount%",
          style: TextStyle(
            color: color == AppColors.primaryColor ? AppColors.whiteColor : Colors.black,
          ),
        ),
      ),
    );
  }
}

class CustomDropDownField extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double height;
  final double width;
  final IconData? icon;
  const CustomDropDownField({
    super.key,
    required this.onTap,
    required this.title,
    required this.height,
    required this.width,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                letterSpacing: 1.2,
                fontSize: 14.0,
                color: AppColors.whiteColor,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Icon(
              icon ?? LucideIcons.chevronDown,
              color: AppColors.whiteColor,
            )
          ],
        ),
      ),
    );
  }
}
