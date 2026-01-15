import 'package:flutter/material.dart';
import 'color_tokens.dart';
import 'typography.dart';

ThemeData buildLightTheme() {
  final base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seed),
    textTheme: buildTextTheme(base.textTheme),
    cardTheme: const CardTheme(
      elevation: 1,
      margin: EdgeInsets.zero,
    ),
  );
}
