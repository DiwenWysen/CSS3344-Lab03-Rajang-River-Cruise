import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String description;

  const TextSection({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        description,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
