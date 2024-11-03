import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState(0)) {
    on<ChangeOnboardingPageEvent>((event, emit) {
      emit(OnboardingState(event.page));
    });
  }
}
