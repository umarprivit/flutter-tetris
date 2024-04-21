import 'package:flutter/material.dart';

class BgBoxes extends StatelessWidget {
  final Color colors;

  const BgBoxes({
    super.key,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: colors,
      ),
    );
  }
}
