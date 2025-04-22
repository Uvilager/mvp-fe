import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mvp_fe/features/fundraisers/domain/models/fundraiser.dart';
import 'package:mvp_fe/features/fundraisers/presentation/providers/fundraiser_detail_provider.dart';

class FundraiserShowScreen extends ConsumerWidget {
  final int fundraiserId;

  const FundraiserShowScreen({super.key, required this.fundraiserId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fundraiserAsyncValue = ref.watch(
      fundraiserDetailProvider(fundraiserId),
    );

    return Scaffold(
      appBar: AppBar(
        // Title will be set dynamically once data loads
      ),
      body: fundraiserAsyncValue.when(
        data: (fundraiser) {
          // Use a separate widget for the body content for better organization
          return _FundraiserDetailBody(fundraiser: fundraiser);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stackTrace) => Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error loading fundraiser details: $error'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      // Allow retrying by invalidating the provider
                      onPressed:
                          () => ref.invalidate(
                            fundraiserDetailProvider(fundraiserId),
                          ),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}

// Widget to display the actual fundraiser details
class _FundraiserDetailBody extends StatelessWidget {
  final Fundraiser fundraiser;

  const _FundraiserDetailBody({required this.fundraiser});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    final dateFormat = DateFormat('yyyy-MM-dd');
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      // Allow scrolling for long content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Header
          if (fundraiser.imageUrl != null && fundraiser.imageUrl!.isNotEmpty)
            Image.network(
              fundraiser.imageUrl!,
              height: 250, // Larger image for detail view
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    height: 250,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.broken_image, size: 60),
                    ),
                  ),
            )
          else // Placeholder if no image
            Container(
              height: 150,
              color: Colors.grey[350],
              child: Center(
                child: Icon(Icons.campaign, size: 60, color: Colors.grey[600]),
              ),
            ),

          // Padding for content below image
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(fundraiser.title, style: textTheme.headlineMedium),
                const SizedBox(height: 12),

                // Description
                Text(fundraiser.description, style: textTheme.bodyLarge),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),

                // Goal and Raised Progress
                Text('Fundraising Goal', style: textTheme.titleMedium),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: fundraiser.raisedPercentage / 100.0,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(5),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Raised: ${currencyFormat.format(fundraiser.raised)}',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Goal: ${currencyFormat.format(fundraiser.goal)}',
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),

                // Dates and Status
                _buildDetailRow(
                  context,
                  Icons.calendar_today,
                  'Start Date:',
                  dateFormat.format(fundraiser.startDate),
                ),
                _buildDetailRow(
                  context,
                  Icons.event_busy,
                  'End Date:',
                  dateFormat.format(fundraiser.endDate),
                ),
                _buildDetailRow(
                  context,
                  Icons.timelapse,
                  'Days Remaining:',
                  fundraiser.daysRemaining.toStringAsFixed(0),
                ),
                _buildDetailRow(
                  context,
                  Icons.info_outline,
                  'Status:',
                  fundraiser.status,
                ),
                _buildDetailRow(context, Icons.tag, 'Type:', fundraiser.type),
                if (fundraiser.uniqueCode != null)
                  _buildDetailRow(
                    context,
                    Icons.qr_code,
                    'Unique Code:',
                    fundraiser.uniqueCode!,
                  ),

                // TODO: Add Donate Button or other actions
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement donation logic or navigation
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Donate button pressed! (Not implemented)',
                          ),
                        ),
                      );
                    },
                    child: const Text('Donate Now'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for consistent detail rows
  Widget _buildDetailRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Theme.of(context).colorScheme.secondary),
          const SizedBox(width: 12),
          Text(
            '$label ',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
