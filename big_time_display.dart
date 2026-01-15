import 'package:flutter/material.dart';

class BigTimeDisplay extends StatelessWidget {
  final String text;
  const BigTimeDisplay({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ),
    );
  }
}
