import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/features/sponsors/domain/models/sponsor.dart';
import 'package:mvp_fe/features/sponsors/presentation/providers/sponsors_notifier.dart';

class SponsorsScreen extends ConsumerWidget {
  const SponsorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sponsorsAsyncValue = ref.watch(sponsorsNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sponsors')),
      body: sponsorsAsyncValue.when(
        data: (sponsors) {
          if (sponsors.isEmpty) {
            return const Center(child: Text('No sponsors found.'));
          }
          return RefreshIndicator(
            onRefresh:
                () =>
                    ref
                        .read(sponsorsNotifierProvider.notifier)
                        .refreshSponsors(),
            child: ListView.builder(
              itemCount: sponsors.length,
              itemBuilder: (context, index) {
                final sponsor = sponsors[index];
                return SponsorCard(sponsor: sponsor);
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stackTrace) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error loading sponsors: $error'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed:
                        () =>
                            ref
                                .read(sponsorsNotifierProvider.notifier)
                                .refreshSponsors(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

// Simple card widget to display sponsor info (can be moved to a separate file)
class SponsorCard extends StatelessWidget {
  final Sponsor sponsor;

  const SponsorCard({super.key, required this.sponsor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display logo if available
            if (sponsor.logoUrl.isNotEmpty)
              Center(
                child: Image.network(
                  sponsor.logoUrl,
                  height: 50, // Adjust height as needed
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.business, size: 50),
                ),
              ),
            if (sponsor.logoUrl.isNotEmpty) const SizedBox(height: 12),
            Text(sponsor.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(sponsor.description),
            const SizedBox(height: 8),
            if (sponsor.website.isNotEmpty)
              InkWell(
                child: Text(
                  sponsor.website,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  // TODO: Implement URL launching
                  print('Tapped website: ${sponsor.website}');
                },
              ),
            if (sponsor.campaignUrl.isNotEmpty) ...[
              const SizedBox(height: 4),
              InkWell(
                child: Text(
                  'Campaign: ${sponsor.campaignUrl}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  // TODO: Implement URL launching
                  print('Tapped campaign: ${sponsor.campaignUrl}');
                },
              ),
            ],
            const SizedBox(height: 8),
            Text('Contact: ${sponsor.contactEmail} / ${sponsor.contactPhone}'),
            if (sponsor.endedAt != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Sponsorship ended: ${sponsor.endedAt!.toLocal().toString().substring(0, 10)}', // Format date as needed
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
