import 'package:flutter/material.dart';

class PodiumItem extends StatelessWidget {
  // Using Map for now, mirroring source. TODO: Use a proper User/LeaderboardEntry model
  final Map<String, dynamic> user;
  final int position;

  const PodiumItem({super.key, required this.user, required this.position});

  @override
  Widget build(BuildContext context) {
    final podiumHeight =
        position == 1
            ? 100.0
            : position == 2
            ? 80.0
            : 60.0;
    final medalColor =
        position == 1
            ? Colors.amber[600]
            : position == 2
            ? Colors.grey[400]
            : Colors.brown[300];
    final String name = user['name'] ?? 'Unknown';
    final int points = user['points'] ?? 0;
    final String imageUrl = user['image'] ?? ''; // TODO: Use actual avatar URL
    final String initials = name.isNotEmpty ? name[0] : '?'; // Basic initials

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: position == 1 ? 36 : 30,
          // TODO: Replace AssetImage with NetworkImage or placeholder logic
          backgroundImage: imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
          backgroundColor:
              imageUrl.isEmpty
                  ? Theme.of(context).colorScheme.secondaryContainer
                  : null,
          child:
              imageUrl.isEmpty
                  ? Text(
                    initials,
                    style: TextStyle(fontSize: position == 1 ? 20 : 18),
                  )
                  : null,
        ),
        const SizedBox(height: 8),
        Text(
          // Show only first name for brevity on podium
          name.split(' ')[0],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: position == 1 ? 16 : 14,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '$points pts',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: position == 1 ? 14 : 12,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: podiumHeight,
          decoration: BoxDecoration(
            color: medalColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            boxShadow: [
              // Add a subtle shadow
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '#$position',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                shadows: [
                  // Add text shadow for better readability
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black54,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
