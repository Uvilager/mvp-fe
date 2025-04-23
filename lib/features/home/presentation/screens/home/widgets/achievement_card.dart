import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  // Using a Map for simplicity, mirroring the generated code's structure.
  // Consider creating a dedicated Achievement model later for type safety.
  final Map<String, dynamic> achievement;

  const AchievementCard({super.key, required this.achievement});

  @override
  Widget build(BuildContext context) {
    final bool completed = achievement['completed'] ?? false;
    final String title = achievement['title'] ?? 'Achievement';
    final String description = achievement['description'] ?? '';
    final IconData icon = achievement['icon'] ?? Icons.emoji_events;
    final String date = achievement['date'] ?? '';
    final double? progress =
        achievement['progress'] as double?; // Handle potential null/type issues

    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias, // Ensure consistency
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12,
        ), // Match generated code's radius
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: completed ? Colors.green[100] : Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: completed ? Colors.green[700] : Colors.grey[600],
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  if (description.isNotEmpty) ...[
                    const SizedBox(
                      height: 2,
                    ), // Small spacing if description exists
                    Text(
                      description,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                  const SizedBox(height: 4),
                  if (completed)
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green[600],
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Completed on $date',
                          style: TextStyle(
                            color: Colors.green[600],
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  else if (progress != null &&
                      progress >= 0 &&
                      progress <= 1) // Check progress validity
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          value: progress,
                          backgroundColor:
                              Colors.grey[300], // Slightly darker background
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.green[600]!,
                          ),
                          minHeight: 6, // Make progress bar slightly thicker
                          borderRadius: BorderRadius.circular(
                            3,
                          ), // Rounded corners
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${(progress * 100).toInt()}% complete',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  else if (date
                      .isNotEmpty) // Show date only if not completed and no progress
                    Text(
                      date, // e.g., "In progress" or a future date
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
