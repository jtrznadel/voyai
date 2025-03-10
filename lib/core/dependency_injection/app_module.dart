import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyai/core/routing/app_router.dart';

@module
abstract class AppModule {
  GoTrueClient get supabaseAuth => Supabase.instance.client.auth;

  @singleton
  AppRouter get router => AppRouter();
}
