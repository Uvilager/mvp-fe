import 'package:flutter/material.dart';

class StatColumn extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color iconColor;

  const StatColumn({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    this.iconColor = Colors.green, // Default color matching generated code
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Prevent column from taking max height
      children: [
        Icon(
          icon,
          color: iconColor, // Use the color directly
          size: 24,
        ), // Use shade for consistency
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }
}
