import 'package:flutter/material.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/constants/sizes.dart';
import 'package:voyai/core/extensions/context_extension.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomeCategoryTile extends StatelessWidget {
  const HomeCategoryTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.smallSpacer,
      children: [
        Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: AppColors.primaryWidgetColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 4,
                      offset: Offset(2, 2))
                ]),
            child: const Icon(LucideIcons.mountain)),
        Text(
          'Mountains',
          style: context.textTheme.bodySmall,
        )
      ],
    );
  }
}
