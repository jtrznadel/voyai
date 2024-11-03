import 'package:flutter/material.dart';
import 'package:voyai/core/constants/sizes.dart';

enum SpacerSize { extraSmall, small, medium, large, extraLarge }

class VerticalSpacer extends StatelessWidget {
  final double height;

  const VerticalSpacer._(this.height, {super.key});

  factory VerticalSpacer.small({Key? key}) {
    return VerticalSpacer._(AppSizes.smallSpacer, key: key);
  }

  factory VerticalSpacer.medium({Key? key}) {
    return VerticalSpacer._(AppSizes.mediumSpacer, key: key);
  }

  factory VerticalSpacer.large({Key? key}) {
    return VerticalSpacer._(AppSizes.largeSpacer, key: key);
  }

  factory VerticalSpacer.extraLarge({Key? key}) {
    return VerticalSpacer._(AppSizes.extraLargeSpacer, key: key);
  }

  factory VerticalSpacer.custom({required double height, Key? key}) {
    return VerticalSpacer._(height, key: key);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class HorizontalSpacer extends StatelessWidget {
  final double width;

  const HorizontalSpacer._(this.width, {super.key});

  factory HorizontalSpacer.small({Key? key}) {
    return HorizontalSpacer._(AppSizes.smallSpacer, key: key);
  }

  factory HorizontalSpacer.medium({Key? key}) {
    return HorizontalSpacer._(AppSizes.mediumSpacer, key: key);
  }

  factory HorizontalSpacer.large({Key? key}) {
    return HorizontalSpacer._(AppSizes.largeSpacer, key: key);
  }

  factory HorizontalSpacer.extraLarge({Key? key}) {
    return HorizontalSpacer._(AppSizes.extraLargeSpacer, key: key);
  }

  factory HorizontalSpacer.custom({required double width, Key? key}) {
    return HorizontalSpacer._(width, key: key);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
