import 'package:flutter/material.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/constants/paddings.dart';
import 'package:voyai/core/extensions/context_extension.dart';

class HorizontalNamedDivider extends StatelessWidget {
  const HorizontalNamedDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppPaddings.dividerVerticalPadding),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.textSecondary,
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPaddings.horizontalPadding),
              child: Text(
                'OR',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              )),
          const Expanded(
            child: Divider(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
