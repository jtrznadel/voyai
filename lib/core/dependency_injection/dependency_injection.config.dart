// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:voyai/core/dependency_injection/app_module.dart' as _i516;
import 'package:voyai/core/routing/app_router.dart' as _i694;
import 'package:voyai/features/auth/data/auth_repository.dart' as _i59;
import 'package:voyai/features/auth/presentation/bloc/auth_bloc.dart' as _i552;
import 'package:voyai/features/auth/presentation/bloc/sign_in/bloc/sign_in_bloc.dart'
    as _i289;
import 'package:voyai/features/auth/repository/auth_repository.dart' as _i650;
import 'package:voyai/features/onboarding/bloc/onboarding_bloc.dart' as _i871;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i454.GoTrueClient>(() => appModule.supabaseAuth);
    gh.factory<_i871.OnboardingBloc>(() => _i871.OnboardingBloc());
    gh.singleton<_i694.AppRouter>(() => appModule.router);
    gh.factory<_i650.IAuthRepository>(
        () => _i59.AuthRepository(gh<_i454.GoTrueClient>()));
    gh.factory<_i289.SignInBloc>(
        () => _i289.SignInBloc(gh<_i650.IAuthRepository>()));
    gh.singleton<_i552.AuthBloc>(
        () => _i552.AuthBloc(gh<_i650.IAuthRepository>()));
    return this;
  }
}

class _$AppModule extends _i516.AppModule {}
