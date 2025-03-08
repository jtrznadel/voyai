import 'package:flutter/material.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/extensions/context_extension.dart';
import 'package:voyai/core/widgets/spacers.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    this.required = true,
    required this.onChanged,
  });

  final String label;
  final String hint;
  final bool required;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: context.textTheme.bodyMedium,
            ),
            required
                ? Text(
                    ' *',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.red,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        VerticalSpacer.small(),
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 2.0,
                )),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
              ),
            ),
            hintText: hint,
          ),
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
