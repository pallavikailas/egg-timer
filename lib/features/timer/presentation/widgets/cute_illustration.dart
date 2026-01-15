import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CuteIllustration extends StatelessWidget {
  const CuteIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    // Put your Figma export here later:
    // - SVG: assets/illustrations/egg.svg
    // - PNG: assets/images/egg.png (use Image.asset)
    return Card(
      child: SizedBox(
        height: 160,
        width: double.infinity,
        child: Center(
          child: SvgPicture.asset(
            'assets/illustrations/placeholder.svg',
            width: 120,
            height: 120,
            semanticsLabel: 'Cute egg illustration',
            placeholderBuilder: (_) => const Text('Add your cute Figma art 🥚'),
          ),
        ),
      ),
    );
  }
}
