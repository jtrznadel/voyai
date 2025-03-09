import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyai/core/common/widgets/app_appbar.dart';
import 'package:voyai/core/common/widgets/app_button.dart';
import 'package:voyai/core/common/widgets/app_text_field.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/constants/enums.dart';
import 'package:voyai/core/constants/paddings.dart';
import 'package:voyai/core/constants/sizes.dart';
import 'package:voyai/core/dependency_injection/dependency_injection.dart';
import 'package:voyai/core/extensions/context_extension.dart';
import 'package:voyai/core/routing/app_router.gr.dart';
import 'package:voyai/core/widgets/spacers.dart';
import 'package:voyai/features/auth/presentation/bloc/sign_up/bloc/sign_up_bloc.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          onBack: () => context.router.replace(const OnboardingRoute()),
        ),
        body: BlocProvider(
          create: (context) => getIt<SignUpBloc>(),
          child: const SignUpForm(),
        ));
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.errorColor,
            ),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPaddings.horizontalPadding,
            ),
            child: Column(
              spacing: AppSizes.mediumSpacer,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start your journey!',
                  style: context.textTheme.headlineLarge,
                ),
                AppTextField(
                  label: 'Username',
                  hint: 'Type your username',
                  onChanged: (value) {
                    context
                        .read<SignUpBloc>()
                        .add(SignUpUsernameChanged(username: value));
                  },
                ),
                AppTextField(
                  label: 'E-mail Address',
                  hint: 'Type your email',
                  onChanged: (value) {
                    context
                        .read<SignUpBloc>()
                        .add(SignUpEmailChanged(email: value));
                  },
                ),
                AppTextField(
                  label: 'Phone number',
                  hint: 'Type your phone number',
                  onChanged: (value) {
                    context
                        .read<SignUpBloc>()
                        .add(SignUpPhoneNumberChanged(phoneNumber: value));
                  },
                ),
                AppTextField(
                  onChanged: (value) {
                    context
                        .read<SignUpBloc>()
                        .add(SignUpPasswordChanged(password: value));
                  },
                  label: 'Password',
                  hint: '********',
                ),
                AppTextField(
                  onChanged: (value) {
                    context.read<SignUpBloc>().add(
                        SignUpConfirmPasswordChanged(confirmPassword: value));
                  },
                  label: 'Confirm Password',
                  hint: '********',
                ),
                state.status == Status.loading
                    ? const Center(child: CircularProgressIndicator())
                    : AppButton(
                        text: 'Sign Up',
                        onPressed: () {
                          context.read<SignUpBloc>().add(SignUpSubmitted());
                        }),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: context.textTheme.bodyMedium,
                    ),
                    TextButton(
                        onPressed: () {
                          context.router.replace(const SignInRoute());
                        },
                        child: Text(
                          'Sign In',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
