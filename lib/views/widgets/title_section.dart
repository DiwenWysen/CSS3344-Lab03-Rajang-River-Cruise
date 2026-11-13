import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String name;
  final String location;
  final double rating;
  final int starCount;
  final VoidCallback onStarPressed;

  const TitleSection({
    super.key,
    required this.name,
    required this.location,
    required this.rating,
    required this.starCount,
    required this.onStarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  location,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),

          Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 4),
                  Text(rating.toString()),
                ],
              ),
              const SizedBox(height: 4),
              TextButton.icon(
                onPressed: onStarPressed,
                icon: const Icon(Icons.thumb_up),
                label: Text('$starCount'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
