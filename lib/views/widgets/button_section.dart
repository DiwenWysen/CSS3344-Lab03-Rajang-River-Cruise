import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context,
      IconData icon,
      String label,
      String message,
      ) {
    return Expanded(
      child: TextButton(
        onPressed: () => _showMessage(context, message),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(
          context,
          Icons.call,
          'CALL',
          'Contact information coming soon.',
        ),
        _buildButton(
          context,
          Icons.near_me,
          'ROUTE',
          'Route information coming soon.',
        ),
        _buildButton(
          context,
          Icons.share,
          'SHARE',
          'Sharing feature coming soon.',
        ),
      ],
    );
  }
}
