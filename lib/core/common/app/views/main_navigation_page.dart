import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/resources/app_icons.dart';
import 'package:voyai/core/routing/app_router.gr.dart';
import 'package:voyai/core/widgets/spacers.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

@RoutePage()
class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        ExploreRoute(),
        VoyRoute(),
        TripsRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          backgroundColor: AppColors.surfaceColor,
          body: child,
          bottomNavigationBar: AppNavigationBottomBar(
            tabsRouter: tabsRouter,
          ),
        );
      },
    );
  }
}

class AppNavigationBottomBar extends StatelessWidget {
  const AppNavigationBottomBar({super.key, required this.tabsRouter});

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .4),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BottomAppBar(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: AppColors.surfaceColor,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavigationBarItem(
                  iconData: LucideIcons.house,
                  onPressed: () => tabsRouter.setActiveIndex(0),
                ),
                NavigationBarItem(
                  iconData: LucideIcons.compass,
                  onPressed: () => tabsRouter.setActiveIndex(1),
                ),
                HorizontalSpacer.custom(width: 64),
                NavigationBarItem(
                  iconData: LucideIcons.route,
                  onPressed: () => tabsRouter.setActiveIndex(3),
                ),
                NavigationBarItem(
                  iconData: LucideIcons.circleUser,
                  onPressed: () => tabsRouter.setActiveIndex(4),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryColor,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => tabsRouter.setActiveIndex(2),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Icon(
                      LucideIcons.brain,
                      size: 36,
                      color: AppColors.primaryWidgetColor,
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.iconData,
    required this.onPressed,
  });

  final IconData iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 64,
          maxWidth: 64,
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData,
            ),
          ),
        ),
      ),
    );
  }
}
