import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:voyai/core/common/widgets/app_appbar.dart';
import 'package:voyai/core/common/widgets/app_button.dart';
import 'package:voyai/core/common/widgets/app_text_field.dart';
import 'package:voyai/core/constants/paddings.dart';
import 'package:voyai/core/extensions/context_extension.dart';
import 'package:voyai/core/routing/app_router.gr.dart';
import 'package:voyai/core/widgets/spacers.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBack: () => context.router.replace(const OnboardingRoute()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPaddings.horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create an account\nand start your journey!',
                style: context.textTheme.headlineLarge,
              ),
              VerticalSpacer.large(),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      onChanged: (p0) {},
                      label: 'First Name',
                      hint: 'John',
                    ),
                  ),
                  HorizontalSpacer.medium(),
                  Expanded(
                    child: AppTextField(
                      onChanged: (p0) {},
                      label: 'Last Name',
                      hint: 'Doe',
                    ),
                  ),
                ],
              ),
              VerticalSpacer.medium(),
              AppTextField(
                label: 'E-mail Address',
                hint: 'johndoe@example.com',
                onChanged: (p0) {},
              ),
              VerticalSpacer.medium(),
              AppTextField(
                label: 'Phone number',
                hint: '+1 234 567 890',
                onChanged: (p0) {},
              ),
              VerticalSpacer.medium(),
              AppTextField(
                onChanged: (p0) {},
                label: 'Password',
                hint: '********',
              ),
              VerticalSpacer.medium(),
              AppTextField(
                onChanged: (p0) {},
                label: 'Confirm Password',
                hint: '********',
              ),
              VerticalSpacer.large(),
              AppButton(text: 'Sign Up', onPressed: () {}),
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
      ),
    );
  }
}
