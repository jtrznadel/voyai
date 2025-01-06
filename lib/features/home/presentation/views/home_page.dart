import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyai/core/common/widgets/app_appbar.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/constants/paddings.dart';
import 'package:voyai/core/extensions/context_extension.dart';
import 'package:voyai/core/resources/app_icons.dart';
import 'package:voyai/core/resources/media_res.dart';
import 'package:voyai/core/widgets/spacers.dart';
import 'package:voyai/features/auth/presentation/views/sign_in_page.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(15),
                  right: Radius.circular(15),
                ),
                child: Image.asset(
                  MediaRes.tempAvatarImage,
                  width: 45,
                ),
              ),
              HorizontalSpacer.medium(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, glad to see you again!',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Jakub Czandelovsky',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPaddings.horizontalPadding,
            vertical: AppPaddings.verticalPadding,
          ),
          child: Column(
            children: [
              SearchBar(
                shape: const WidgetStatePropertyAll<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                backgroundColor: const WidgetStatePropertyAll<Color>(
                  AppColors.primaryWidgetColor,
                ),
                textStyle: WidgetStatePropertyAll<TextStyle>(
                  context.textTheme.bodyMedium!,
                ),
                hintText: 'Search for a next destination...',
                hintStyle: WidgetStatePropertyAll<TextStyle>(
                  context.textTheme.bodySmall!.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                leading: SvgPicture.asset(
                  AppIcons.search,
                  colorFilter: const ColorFilter.mode(
                    AppColors.iconColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
