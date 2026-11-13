import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final String imageUrl;

  const ImageSection({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: imageUrl.isNotEmpty
          ? Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholder();
        },
      )
          : _buildPlaceholder(),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.blueGrey.shade200,
      child: const Center(
        child: Icon(
          Icons.directions_boat,
          size: 80,
          color: Colors.white,
        ),
      ),
    );
  }
}
