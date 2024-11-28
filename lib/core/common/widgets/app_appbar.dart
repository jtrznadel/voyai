import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/resources/app_icons.dart';
import 'package:voyai/core/resources/media_res.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.onBack,
  });

  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        MediaRes.voyaiImgBlack,
        height: 20,
      ),
      leading: IconButton(
        icon: SvgPicture.asset(
          AppIcons.chevronLeft,
          colorFilter: const ColorFilter.mode(
            AppColors.iconColor,
            BlendMode.srcIn,
          ),
        ),
        onPressed: () {
          context.router.maybePop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
