import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    this.iconSvgPath,
  });

  final String text;
  final dynamic onPressed;
  final Color? bgColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? width;
  final String? iconSvgPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor: textColor,
            textStyle: textStyle ?? context.textTheme.bodyLarge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconSvgPath != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SvgPicture.asset(
                        iconSvgPath!,
                        width: 20,
                        height: 20,
                      ),
                    )
                  : const SizedBox(),
              Text(text),
            ],
          )),
    );
  }
}
