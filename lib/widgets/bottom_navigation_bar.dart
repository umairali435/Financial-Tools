import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:tax_calc/utils/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onPressesPost;
  final VoidCallback onPressesProfile;
  const CustomBottomNavigationBar({
    super.key,
    required this.onPressesPost,
    required this.onPressesProfile,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: AppColors.primaryColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              LucideIcons.textQuote,
              color: currentIndex == 0 ? AppColors.primaryColor : AppColors.whiteColor,
            ),
            onPressed: onPressesPost,
          ),
          const Gap(30.0),
          IconButton(
            icon: Icon(
              LucideIcons.user,
              color: currentIndex == 1 ? AppColors.primaryColor : AppColors.whiteColor,
            ),
            onPressed: onPressesProfile,
          ),
        ],
      ),
    );
  }
}
