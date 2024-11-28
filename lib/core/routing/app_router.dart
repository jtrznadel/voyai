import 'package:auto_route/auto_route.dart';
import 'package:voyai/core/routing/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainNavigationRoute.page, initial: true, children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: ExploreRoute.page),
          AutoRoute(page: VoyRoute.page),
          AutoRoute(page: TripsRoute.page),
          AutoRoute(page: ProfileRoute.page),
        ]),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
      ];
}
