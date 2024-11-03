import 'package:flutter/material.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/extensions/context_extension.dart';
import 'package:voyai/features/onboarding/presentation/views/onboarding_page.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.bgColor = AppColors.primaryColor,
    this.textColor = AppColors.textContrast,
    this.textStyle,
    this.width = double.infinity,
  });

  final String text;
  final dynamic onPressed;
  final Color? bgColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          textStyle: textStyle ?? context.textTheme.bodyLarge,
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
