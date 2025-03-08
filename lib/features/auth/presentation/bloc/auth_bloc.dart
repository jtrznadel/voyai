import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyai/features/auth/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthInitialCheck>(_initCheck);
    on<AuthLogout>(_logout);
    on<AuthChangeCurrentUser>(_changeCurrentUser);

    _startUserSubscription();
  }

  Future<void> _initCheck(
    AuthInitialCheck event,
    Emitter<AuthState> emit,
  ) async {
    User? signedInUser = _authRepository.getSignedInUser();
    signedInUser != null
        ? emit(AuthUserAuthenticated(signedInUser))
        : emit(AuthUserUnauthenticated());
  }

  Future<void> _logout(
    AuthLogout event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepository.signOut();
  }

  Future<void> _changeCurrentUser(
    AuthChangeCurrentUser event,
    Emitter<AuthState> emit,
  ) async {
    event.user != null
        ? emit(AuthUserAuthenticated(event.user!))
        : emit(AuthUserUnauthenticated());
  }

  void _startUserSubscription() => _userSubscription = _authRepository
      .getCurrentUser()
      .listen((user) => add(AuthChangeCurrentUser(user)));

  final IAuthRepository _authRepository;
  StreamSubscription<User?>? _userSubscription;
}
