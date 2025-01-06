import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyai/core/common/widgets/app_appbar.dart';
import 'package:voyai/core/common/widgets/app_button.dart';
import 'package:voyai/core/common/widgets/app_text_field.dart';
import 'package:voyai/core/common/widgets/horizontal_named_divider.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/constants/paddings.dart';
import 'package:voyai/core/extensions/context_extension.dart';
import 'package:voyai/core/resources/app_icons.dart';
import 'package:voyai/core/resources/media_res.dart';
import 'package:voyai/core/routing/app_router.gr.dart';
import 'package:voyai/core/widgets/spacers.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPaddings.horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back 👋\nNice to see you again!',
                style: context.textTheme.headlineLarge,
              ),
              VerticalSpacer.large(),
              const AppTextField(
                label: 'Your e-mail address',
                hint: 'Type your email',
              ),
              VerticalSpacer.medium(),
              const AppTextField(
                label: 'Your e-mail address',
                hint: 'Type your email',
              ),
              VerticalSpacer.medium(),
              AppButton(text: 'Sign In', onPressed: () {}),
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
              VerticalSpacer.medium(),
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
      ),
    );
  }
}
