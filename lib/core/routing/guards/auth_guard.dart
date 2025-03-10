import 'package:auto_route/auto_route.dart';
import 'package:voyai/core/dependency_injection/dependency_injection.dart';
import 'package:voyai/core/routing/app_router.gr.dart';
import 'package:voyai/features/auth/presentation/bloc/auth_bloc.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authBloc = getIt.get<AuthBloc>();

    final authState = authBloc.state;
    if (authState is AuthUserAuthenticated) {
      resolver.next(true);
    } else {
      resolver.next(false);
      router.push(const SignInRoute());
    }
  }
}
