import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyai/core/dependency_injection/dependency_injection.dart';
import 'package:voyai/core/routing/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voyai/core/theme/app_theme.dart';
import 'package:voyai/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:voyai/features/onboarding/bloc/onboarding_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
    debug: true,
  );
  configureDependencies();

  runApp(
    const MyApp(),
  );
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt.get<OnboardingBloc>()),
        BlocProvider.value(
            value: getIt.get<AuthBloc>()..add(AuthInitialCheck())),
      ],
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
