import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart'; // Import go_router
import 'package:intl/intl.dart'; // For date formatting
import 'package:mvp_fe/features/fundraisers/domain/models/fundraiser.dart';
import 'package:mvp_fe/features/fundraisers/presentation/providers/fundraisers_notifier.dart';

class FundraisersScreen extends ConsumerWidget {
  const FundraisersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fundraisersAsyncValue = ref.watch(fundraisersNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Fundraisers')),
      body: fundraisersAsyncValue.when(
        data: (fundraisers) {
          if (fundraisers.isEmpty) {
            return const Center(child: Text('No fundraisers found.'));
          }
          return RefreshIndicator(
            onRefresh:
                () =>
                    ref
                        .read(fundraisersNotifierProvider.notifier)
                        .refreshFundraisers(),
            child: ListView.builder(
              itemCount: fundraisers.length,
              itemBuilder: (context, index) {
                final fundraiser = fundraisers[index];
                return FundraiserCard(fundraiser: fundraiser);
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
                  Text('Error loading fundraisers: $error'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed:
                        () =>
                            ref
                                .read(fundraisersNotifierProvider.notifier)
                                .refreshFundraisers(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

// Simple card widget to display fundraiser info (can be moved to a separate file)
class FundraiserCard extends StatelessWidget {
  final Fundraiser fundraiser;

  const FundraiserCard({super.key, required this.fundraiser});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
    ); // Adjust locale/symbol as needed
    final dateFormat = DateFormat('yyyy-MM-dd');

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias, // For image border radius
      child: InkWell(
        // Wrap with InkWell for tap detection
        onTap: () {
          // Navigate to the detail screen using go_router
          context.go('/fundraisers/${fundraiser.id}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display image if available
            if (fundraiser.imageUrl != null && fundraiser.imageUrl!.isNotEmpty)
              Image.network(
                fundraiser.imageUrl!,
                height: 150, // Adjust height as needed
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.broken_image, size: 50),
                      ),
                    ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fundraiser.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(fundraiser.description),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: fundraiser.raisedPercentage / 100.0,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Raised: ${currencyFormat.format(fundraiser.raised)}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Goal: ${currencyFormat.format(fundraiser.goal)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ends: ${dateFormat.format(fundraiser.endDate)} (${fundraiser.daysRemaining.toStringAsFixed(0)} days left)',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Status: ${fundraiser.status}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  // Add more details or actions if needed (e.g., Donate button)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
