import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';
import 'theme/app_theme.dart';

class EggTimerApp extends StatelessWidget {
  const EggTimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = buildRouter();

    return MaterialApp.router(
      title: 'Egg Timer',
      theme: buildLightTheme(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
