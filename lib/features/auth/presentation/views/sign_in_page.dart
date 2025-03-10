import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyai/core/common/widgets/app_appbar.dart';
import 'package:voyai/core/common/widgets/app_button.dart';
import 'package:voyai/core/common/widgets/app_text_field.dart';
import 'package:voyai/core/common/widgets/horizontal_named_divider.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/constants/enums.dart';
import 'package:voyai/core/constants/paddings.dart';
import 'package:voyai/core/constants/sizes.dart';
import 'package:voyai/core/dependency_injection/dependency_injection.dart';
import 'package:voyai/core/extensions/context_extension.dart';
import 'package:voyai/core/resources/app_icons.dart';
import 'package:voyai/core/resources/media_res.dart';
import 'package:voyai/core/routing/app_router.gr.dart';
import 'package:voyai/core/widgets/spacers.dart';
import 'package:voyai/features/auth/presentation/bloc/sign_in/bloc/sign_in_bloc.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocProvider(
        create: (context) => getIt<SignInBloc>(),
        child: const SignInForm(),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
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
                horizontal: AppPaddings.horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSizes.mediumSpacer,
              children: [
                Text(
                  'Welcome back 👋\nNice to see you again!',
                  style: context.textTheme.headlineLarge,
                ),
                AppTextField(
                  label: 'Your e-mail address',
                  hint: 'Type your email',
                  onChanged: (value) {
                    context
                        .read<SignInBloc>()
                        .add(SignInEmailChanged(email: value));
                  },
                ),
                AppTextField(
                  onChanged: (value) {
                    context
                        .read<SignInBloc>()
                        .add(SignInPasswordChanged(password: value));
                  },
                  label: 'Your password',
                  hint: 'Type your password',
                ),
                state.status == Status.loading
                    ? const Center(child: CircularProgressIndicator())
                    : AppButton(
                        text: 'Sign In',
                        onPressed: () {
                          context.read<SignInBloc>().add(SignInSubmitted());
                        }),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot your password?',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      )),
                ),
                const HorizontalNamedDivider(),
                AppButton(
                  text: 'Continue with Google',
                  iconSvgPath: MediaRes.googleLogo,
                  bgColor: AppColors.surfaceColor,
                  textColor: AppColors.textPrimary,
                  onPressed: () {},
                ),
                AppButton(
                  text: 'Continue with Apple',
                  iconSvgPath: MediaRes.appleLogo,
                  bgColor: AppColors.surfaceColor,
                  textColor: AppColors.textPrimary,
                  onPressed: () {},
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: context.textTheme.bodyMedium,
                    ),
                    TextButton(
                        onPressed: () {
                          context.router.replace(const SignUpRoute());
                        },
                        child: Text(
                          'Sign Up',
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
