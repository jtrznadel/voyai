import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/routing/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voyai/core/theme/app_theme.dart';
import 'package:voyai/features/onboarding/bloc/onboarding_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => OnboardingBloc())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'voyai',
        theme: AppTheme.theme,
        routerConfig: router.config(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('pl'),
        ],
        locale: const Locale('en'),
      ),
    );
  }
}
