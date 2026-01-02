
import 'package:flutter/material.dart';

class WgText extends StatelessWidget {
  final List<TextSpan> spans;
  const WgText({super.key, required this.spans});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: spans));
  }
}

