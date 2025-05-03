import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/features/sponsors/domain/models/sponsor.dart';
import 'package:mvp_fe/features/sponsors/presentation/providers/sponsors_notifier.dart';
import 'package:go_router/go_router.dart';

class SponsorsScreen extends ConsumerWidget {
  const SponsorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sponsorsAsyncValue = ref.watch(sponsorsNotifierProvider);

    // EXACT same colors as login/register/fundraisers screens
    const Color primaryColor = Color(0xFFf08a6e); // --primary
    const Color secondaryColor = Color(0xFF2c3e50); // --secondary
    const Color lightColor = Color(0xFFf9f7f4); // --light
    const Color whiteColor = Colors.white;

    return Scaffold(
      backgroundColor: lightColor, // Consistent with other screens
      appBar: AppBar(
        backgroundColor: secondaryColor, // Consistent with header styling
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Image.asset(
                'img/logo.png', // Same logo path as other screens
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
            const Text(
              'Sponzori',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: whiteColor),
            onPressed: () => ref.read(sponsorsNotifierProvider.notifier).refreshSponsors(),
          ),
        ],
      ),
      body: sponsorsAsyncValue.when(
        data: (sponsors) {
          if (sponsors.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.business_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nema dostupnih sponzora',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Trenutno nema aktivnih sponzora.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(sponsorsNotifierProvider.notifier).refreshSponsors(),
            color: primaryColor, // Consistent with primary color
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: sponsors.length,
              itemBuilder: (context, index) {
                final sponsor = sponsors[index];
                return SponsorCard(sponsor: sponsor);
              },
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor), // Consistent loading color
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
                        'Došlo je do greške prilikom učitavanja sponzora.',
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
                  onPressed: () => ref.read(sponsorsNotifierProvider.notifier).refreshSponsors(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, // Consistent button styling
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

class SponsorCard extends StatelessWidget {
  final Sponsor sponsor;

  const SponsorCard({super.key, required this.sponsor});

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

  void _showContactSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFf08a6e),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // EXACT same colors as other screens
    const Color primaryColor = Color(0xFFf08a6e); // --primary
    const Color secondaryColor = Color(0xFF2c3e50); // --secondary
    const Color whiteColor = Colors.white;

    final fullLogoUrl = _getFullImageUrl(sponsor.logoUrl);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12), // Consistent with other cards
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15), // Exact same shadow as other cards
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          // Navigate to the sponsor detail screen using go_router
          context.push('/sponsors/${sponsor.id}');
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo and Title Row
              Row(
                children: [
                  // Logo
                  if (fullLogoUrl.isNotEmpty)
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          fullLogoUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.business,
                              size: 30,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.business,
                        size: 30,
                        color: primaryColor,
                      ),
                    ),
                  const SizedBox(width: 16),
                  
                  // Title and Status
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sponsor.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: secondaryColor,
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: sponsor.endedAt == null 
                                ? Colors.green.withOpacity(0.1)
                                : Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: sponsor.endedAt == null 
                                  ? Colors.green.withOpacity(0.3)
                                  : Colors.red.withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            sponsor.endedAt == null ? 'Aktivno' : 'Završeno',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: sponsor.endedAt == null ? Colors.green : Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Arrow icon to indicate clickability
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Description
              Text(
                sponsor.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),

              // Contact Information - make these non-clickable in list view
              Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: 14,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      sponsor.contactEmail,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.phone_outlined,
                    size: 14,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 6),
                  Text(
                    sponsor.contactPhone,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              
              // End date information
              if (sponsor.endedAt != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.event_busy,
                        size: 14,
                        color: Colors.red.shade600,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Završeno: ${_formatDate(sponsor.endedAt!)}',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}.${date.month}.${date.year}';
  }
}
