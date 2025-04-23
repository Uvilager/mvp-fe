import 'package:flutter/material.dart';

class LeaderboardTile extends StatelessWidget {
  // Using Map for now. TODO: Use a proper User/LeaderboardEntry model
  final Map<String, dynamic> user;
  final bool isCurrentUser;

  const LeaderboardTile({
    super.key,
    required this.user,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    final int rank = user['rank'] ?? 0;
    final String name = user['name'] ?? 'Unknown User';
    final int hours = user['hours'] ?? 0;
    final int projects = user['projects'] ?? 0;
    final int points = user['points'] ?? 0;
    final String imageUrl = user['image'] ?? ''; // TODO: Use actual avatar URL
    final String initials = name.isNotEmpty ? name[0] : '?'; // Basic initials

    final Color rankColor =
        rank <= 3 ? Colors.amber.shade700 : Colors.grey.shade600;
    final Color tileColor = isCurrentUser ? Colors.green.shade50 : Colors.white;
    final FontWeight nameWeight =
        isCurrentUser ? FontWeight.bold : FontWeight.normal;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: tileColor,
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 30, // Increased width for potentially larger rank numbers
              child: Text(
                '#$rank',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: rankColor,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 20, // Standard list tile size
              // TODO: Replace AssetImage with NetworkImage or placeholder logic
              backgroundImage:
                  imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
              backgroundColor:
                  imageUrl.isEmpty
                      ? Theme.of(context).colorScheme.secondaryContainer
                      : null,
              child: imageUrl.isEmpty ? Text(initials) : null,
            ),
          ],
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: nameWeight),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '$hours hours • $projects projects',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          '$points pts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: rankColor, // Use same color as rank for consistency
            fontSize: 14,
          ),
        ),
        // Optional: Add onTap for future profile navigation
        // onTap: () {
        //   print('Tapped on $name');
        // },
      ),
    );
  }
}
