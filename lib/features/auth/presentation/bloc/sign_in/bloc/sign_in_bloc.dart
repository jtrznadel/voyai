import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyai/core/constants/enums.dart';
import 'package:voyai/features/auth/repository/auth_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final IAuthRepository _authRepository;

  SignInBloc(this._authRepository) : super(SignInState.initial()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSubmitted);
    on<SignInResetForm>(_onResetForm);
  }

  void _onEmailChanged(
    SignInEmailChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await _authRepository.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: Status.success));
    } on AuthException catch (e) {
      emit(state.copyWith(
        status: Status.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        errorMessage: 'An unexpected error occurred. Please try again.',
      ));
    }
  }

  void _onResetForm(
    SignInResetForm event,
    Emitter<SignInState> emit,
  ) {
    emit(SignInState.initial());
  }
}
