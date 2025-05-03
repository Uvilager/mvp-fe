import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
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

    // EXACT same colors as login/register screens
    const Color primaryColor = Color(0xFFf08a6e); // --primary
    const Color secondaryColor = Color(0xFF2c3e50); // --secondary
    const Color lightColor = Color(0xFFf9f7f4); // --light
    const Color whiteColor = Colors.white;

    return Scaffold(
      backgroundColor: lightColor, // Consistent with login/register
      appBar: AppBar(
        backgroundColor: secondaryColor, // Consistent with header styling
        elevation: 0,
        iconTheme: const IconThemeData(color: whiteColor),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Image.asset(
                'img/logo.png', // Same logo path as home screen
                width: 40,
                height: 40,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.business_rounded,
                  size: 24,
                  color: whiteColor,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: fundraiserAsyncValue.maybeWhen(
                data: (fundraiser) => Text(
                  fundraiser.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                orElse: () => const Text(
                  'Humanitarna akcija',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: whiteColor),
            onPressed: () => ref.invalidate(
              fundraiserDetailProvider(fundraiserId),
            ),
          ),
        ],
      ),
      body: fundraiserAsyncValue.when(
        data: (fundraiser) {
          return _FundraiserDetailBody(fundraiser: fundraiser);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    border: Border.all(color: Colors.red.shade200),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.red.shade600,
                        size: 48,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Greška pri učitavanju',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.red.shade700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Došlo je do greške prilikom učitavanja detalja humanitarne akcije.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red.shade600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => ref.invalidate(
                    fundraiserDetailProvider(fundraiserId),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: whiteColor,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Pokušaj ponovo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FundraiserDetailBody extends StatelessWidget {
  final Fundraiser fundraiser;

  const _FundraiserDetailBody({required this.fundraiser});

  // Helper function to construct the full image URL
  String _getFullImageUrl(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) return '';
    
    // If the URL is already absolute, return as is
    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      return imageUrl;
    }
    
    // Remove leading slash if present to avoid double slashes
    String cleanImageUrl = imageUrl.startsWith('/') ? imageUrl.substring(1) : imageUrl;
    
    // Prepend the MVP base URL
    return 'https://mvpsrbije.com/$cleanImageUrl';
  }

  // Helper function to get Serbian status text
  String _getStatusTextSr(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return 'Aktivna';
      case 'inactive':
        return 'Neaktivna';
      case 'completed':
        return 'Završena';
      case 'pending':
        return 'Na čekanju';
      default:
        return status.toUpperCase();
    }
  }

  // Helper function to get Serbian type text
  String _getTypeTextSr(String type) {
    switch (type.toLowerCase()) {
      case 'donation':
        return 'Donacija';
      case 'project':
        return 'Projekat';
      case 'fundraiser':
        return 'Humanitarna akcija';
      case 'campaign':
        return 'Kampanja';
      default:
        return type.toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'sr_RS',
      symbol: 'RSD ',
      decimalDigits: 0,
    );
    final dateFormat = DateFormat('dd.MM.yyyy');

    // EXACT same colors as login/register screens
    const Color primaryColor = Color(0xFFf08a6e); // --primary
    const Color secondaryColor = Color(0xFF2c3e50); // --secondary
    const Color whiteColor = Colors.white;

    final fullImageUrl = _getFullImageUrl(fundraiser.imageUrl);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Header
          if (fullImageUrl.isNotEmpty)
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Image.network(
                fullImageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        primaryColor.withOpacity(0.1),
                        primaryColor.withOpacity(0.05),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            )
          else
            Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    primaryColor.withOpacity(0.1),
                    primaryColor.withOpacity(0.05),
                  ],
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.campaign,
                  size: 80,
                  color: primaryColor.withOpacity(0.6),
                ),
              ),
            ),

          // Content Container with consistent styling
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12), // Consistent with login/register card styling
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15), // Exact same shadow as login/register
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title with type badge
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          fundraiser.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: secondaryColor, // Consistent with form labels
                            height: 1.3,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _getTypeColor(fundraiser.type).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _getTypeColor(fundraiser.type).withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          _getTypeTextSr(fundraiser.type),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: _getTypeColor(fundraiser.type),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Description
                  Text(
                    fundraiser.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Progress Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: primaryColor.withOpacity(0.1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Cilj prikupljanja',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              '${fundraiser.raisedPercentage.toStringAsFixed(1)}%',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        LinearProgressIndicator(
                          value: fundraiser.raisedPercentage / 100.0,
                          minHeight: 12,
                          borderRadius: BorderRadius.circular(6),
                          backgroundColor: Colors.grey[200],
                          valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Prikupljeno',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  currencyFormat.format(fundraiser.raised),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Cilj',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  currencyFormat.format(fundraiser.goal),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Details Section
                  const Text(
                    'Detalji akcije',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildDetailRow(
                    context,
                    Icons.calendar_today,
                    'Početak:',
                    dateFormat.format(fundraiser.startDate),
                  ),
                  _buildDetailRow(
                    context,
                    Icons.event_busy,
                    'Završetak:',
                    dateFormat.format(fundraiser.endDate),
                  ),
                  _buildDetailRow(
                    context,
                    Icons.timelapse,
                    'Preostalo dana:',
                    fundraiser.daysRemaining.toStringAsFixed(0),
                  ),
                  _buildDetailRow(
                    context,
                    Icons.info_outline,
                    'Status:',
                    _getStatusTextSr(fundraiser.status),
                  ),
                  _buildDetailRow(
                    context,
                    Icons.category,
                    'Tip:',
                    _getTypeTextSr(fundraiser.type),
                  ),
                  if (fundraiser.uniqueCode != null)
                    _buildDetailRow(
                      context,
                      Icons.qr_code,
                      'Jedinstveni kod:',
                      fundraiser.uniqueCode!,
                    ),

                  const SizedBox(height: 32),

                  // Action Buttons
                  Column(
                    children: [
                      // Project Button (if fundraiser has a valid project_id)
                      if (_hasProjectId(fundraiser)) ...[
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate to project details
                              final projectId = _getProjectId(fundraiser);
                              if (projectId != null) {
                                context.push('/projects/$projectId');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: whiteColor, // White background
                              foregroundColor: primaryColor, // Primary orange text
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              side: const BorderSide(color: primaryColor, width: 2), // Primary orange border
                              elevation: 0,
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.assignment, size: 20),
                                const SizedBox(width: 8),
                                const Text(
                                  'Pogledaj povezani projekat',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Donate Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Implement donation logic
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Funkcionalnost doniranja će uskoro biti dostupna!',
                                ),
                                backgroundColor: primaryColor,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor, // Consistent with login/register button
                            foregroundColor: whiteColor,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Consistent with login/register
                            ),
                            elevation: 0,
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.favorite, size: 20),
                              const SizedBox(width: 8),
                              const Text('Doniraj sada'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to get type color
  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'donation':
        return Colors.green;
      case 'project':
        return Colors.blue;
      case 'fundraiser':
        return const Color(0xFFf08a6e); // Primary color
      case 'campaign':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  // Helper function to check if fundraiser has project_id
  bool _hasProjectId(Fundraiser fundraiser) {
    // Check if projectId is greater than 0 (assuming 0 means no project)
    return fundraiser.projectId > 0;
  }

  // Helper function to get project_id from fundraiser
  int? _getProjectId(Fundraiser fundraiser) {
    return fundraiser.projectId > 0 ? fundraiser.projectId : null;
  }

  Widget _buildDetailRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    const Color primaryColor = Color(0xFFf08a6e);
    const Color secondaryColor = Color(0xFF2c3e50);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 18,
              color: primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: secondaryColor,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return 'Aktivna';
      case 'completed':
        return 'Završena';
      case 'pending':
        return 'Na čekanju';
      default:
        return status;
    }
  }
}
