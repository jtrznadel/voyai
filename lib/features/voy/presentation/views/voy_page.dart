import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voyai/core/common/widgets/app_button.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/extensions/context_extension.dart';
import 'package:voyai/core/resources/media_res.dart';

@RoutePage()
class VoyPage extends StatelessWidget {
  const VoyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Stack(
        children: [
          const Positioned.fill(
            child: ColoredBox(
              color: AppColors.primaryWidgetColor,
            ),
          ),
          Stack(children: [
            Positioned(
                left: 0,
                right: 20,
                top: 20,
                child: Image.asset(
                  MediaRes.voyaiModelOnboardingImage,
                )),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              top: context.height * .5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.surfaceColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    spacing: 10,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Hello, I\'m ',
                          style: context.textTheme.headlineMedium,
                          children: [
                            TextSpan(
                              text: 'Voy',
                              style: context.textTheme.headlineLarge?.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'First, let me introduce myself. I am your personal travel assistant. I will help you plan your trips, find the best deals and make your travel experience unforgettable.',
                        style: context.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      Text('Now, if we know each other...',
                          style: context.textTheme.bodyMedium,
                          textAlign: TextAlign.center),
                      AppButton(text: 'Let\'s start planning', onPressed: () {})
                    ],
                  ),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
