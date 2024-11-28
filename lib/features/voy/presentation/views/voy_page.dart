import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VoyPage extends StatelessWidget {
  const VoyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Voy Page'),
      ],
    );
  }
}
