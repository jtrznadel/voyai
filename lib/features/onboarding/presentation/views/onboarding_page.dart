import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:voyai/core/common/widgets/app_button.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/constants/paddings.dart';
import 'package:voyai/core/extensions/context_extension.dart';
import 'package:voyai/core/resources/media_res.dart';
import 'package:voyai/core/routing/app_router.gr.dart';
import 'package:voyai/core/widgets/spacers.dart';
import 'package:voyai/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:voyai/features/onboarding/data/onboarding_page_model.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    final List<OnboardingPageModel> pages = [
      OnboardingPageModel(
        title: context.locale.onBoardingSloganPageOne,
        description: context.locale.onBoardingDescriptionPageOne,
      ),
      OnboardingPageModel(
        title: context.locale.onBoardingSloganPageTwo,
        description: context.locale.onBoardingDescriptionPageTwo,
      ),
      OnboardingPageModel(
        title: context.locale.onBoardingSloganPageThree,
        description: context.locale.onBoardingDescriptionPageThree,
      ),
    ];

    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final index = state.page;
        return Scaffold(
          body: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: -index * 200,
                child: Image.asset(
                  MediaRes.onBoardingImage,
                  fit: BoxFit.cover,
                  width: context.width + 400,
                  height: context.height,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPaddings.defaultPadding),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            controller.jumpToPage(pages.length - 1);
                            context.read<OnboardingBloc>().add(
                                ChangeOnboardingPageEvent(pages.length - 1));
                          },
                          child: Text(
                            context.locale.skip,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          itemCount: pages.length,
                          controller: controller,
                          onPageChanged: (value) {
                            context
                                .read<OnboardingBloc>()
                                .add(ChangeOnboardingPageEvent(value));
                          },
                          itemBuilder: (context, _) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: Text(
                                    pages[index].title,
                                    key: ValueKey(pages[index].title),
                                    style:
                                        context.textTheme.bodyLarge?.copyWith(
                                      fontSize: 24,
                                      color: AppColors.textContrast,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                VerticalSpacer.medium(),
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: Text(
                                    pages[index].description,
                                    key: ValueKey(pages[index].description),
                                    style:
                                        context.textTheme.bodyLarge?.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      VerticalSpacer.extraLarge(),
                      Align(
                        child: AppButton(
                          text: 'Get Started',
                          onPressed: () {
                            context.router.push(const SignInRoute());
                          },
                        ),
                      ),
                      VerticalSpacer.large(),
                      SmoothPageIndicator(
                        controller: controller,
                        count: pages.length,
                        effect: const WormEffect(
                          dotWidth: 20,
                          dotHeight: 10,
                          activeDotColor: AppColors.primaryColor,
                          dotColor: AppColors.surfaceColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
