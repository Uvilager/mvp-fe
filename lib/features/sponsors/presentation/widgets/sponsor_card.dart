import 'package:flutter/material.dart';

class SponsorCard extends StatelessWidget {
  final String sponsorName;

  const SponsorCard({super.key, required this.sponsorName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          sponsorName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
