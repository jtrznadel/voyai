part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

final class ChangeOnboardingPageEvent extends OnboardingEvent {
  final int page;

  ChangeOnboardingPageEvent(this.page);
}
