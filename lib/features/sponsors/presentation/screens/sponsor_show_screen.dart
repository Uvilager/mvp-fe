import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mvp_fe/features/sponsors/domain/models/sponsor.dart';
import 'package:mvp_fe/features/sponsors/presentation/providers/sponsor_with_projects_provider.dart';

class SponsorShowScreen extends ConsumerWidget {
  final int sponsorId;

  const SponsorShowScreen({super.key, required this.sponsorId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sponsorWithProjectsAsyncValue = ref.watch(
      sponsorWithProjectsProvider(sponsorId),
    );

    // EXACT same colors as other screens
    const Color primaryColor = Color(0xFFf08a6e); // --primary
    const Color secondaryColor = Color(0xFF2c3e50); // --secondary
    const Color lightColor = Color(0xFFf9f7f4); // --light
    const Color whiteColor = Colors.white;

    return Scaffold(
      backgroundColor: lightColor, // Consistent with other screens
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
            Expanded(
              child: sponsorWithProjectsAsyncValue.maybeWhen(
                data: (data) {
                  final sponsor = Sponsor.fromJson(data['sponsor']);
                  return Text(
                    sponsor.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                },
                orElse: () => const Text(
                  'Sponzor',
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
            onPressed: () {
              ref.invalidate(sponsorWithProjectsProvider(sponsorId));
            },
          ),
        ],
      ),
      body: sponsorWithProjectsAsyncValue.when(
        data: (data) {
          final sponsor = Sponsor.fromJson(data['sponsor']);
          final projectsData = data['projects'] as List<dynamic>;
          return _SponsorDetailBody(
            sponsor: sponsor, 
            sponsorId: sponsorId,
            projectsData: projectsData,
          );
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
                        'Došlo je do greške prilikom učitavanja detalja sponzora.',
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
                  onPressed: () {
                    ref.invalidate(sponsorWithProjectsProvider(sponsorId));
                  },
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

class _SponsorDetailBody extends ConsumerWidget {
  final Sponsor sponsor;
  final int sponsorId;
  final List<dynamic> projectsData;

  const _SponsorDetailBody({
    required this.sponsor, 
    required this.sponsorId,
    required this.projectsData,
  });

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
  Widget build(BuildContext context, WidgetRef ref) {
    final fullLogoUrl = _getFullImageUrl(sponsor.logoUrl);
    
    // EXACT same colors as other screens
    const Color primaryColor = Color(0xFFf08a6e); // --primary
    const Color secondaryColor = Color(0xFF2c3e50); // --secondary
    const Color whiteColor = Colors.white;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sponsor Header Section
          Container(
            margin: const EdgeInsets.all(16),
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
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[200]!),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              fullLogoUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.business,
                                  size: 40,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.business,
                            size: 40,
                            color: primaryColor,
                          ),
                        ),
                      const SizedBox(width: 20),
                      
                      // Title and Status
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sponsor.title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: secondaryColor,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: sponsor.endedAt == null 
                                    ? Colors.green.withOpacity(0.1)
                                    : Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: sponsor.endedAt == null 
                                      ? Colors.green.withOpacity(0.3)
                                      : Colors.red.withOpacity(0.3),
                                ),
                              ),
                              child: Text(
                                sponsor.endedAt == null ? 'Aktivno' : 'Završeno',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: sponsor.endedAt == null ? Colors.green : Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Description
                  Text(
                    sponsor.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  
                  // Body content if available
                  if (sponsor.body.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      sponsor.body,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                  ],
                  
                  const SizedBox(height: 20),

                  // Contact Information
                  _buildContactRow(
                    context: context,
                    icon: Icons.email_outlined,
                    label: 'Email:',
                    value: sponsor.contactEmail,
                    onTap: () => _showContactSnackBar(context, 'Email: ${sponsor.contactEmail}'),
                  ),
                  const SizedBox(height: 12),
                  _buildContactRow(
                    context: context,
                    icon: Icons.phone_outlined,
                    label: 'Telefon:',
                    value: sponsor.contactPhone,
                    onTap: () => _showContactSnackBar(context, 'Telefon: ${sponsor.contactPhone}'),
                  ),
                  
                  // Action Buttons
                  if (sponsor.website.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _showContactSnackBar(context, 'Vebsajt: ${sponsor.website}'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: whiteColor,
                          foregroundColor: primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(color: primaryColor, width: 2),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.language, size: 20),
                            const SizedBox(width: 8),
                            const Text(
                              'Poseti vebsajt',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                  if (sponsor.campaignUrl.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _showContactSnackBar(context, 'Kampanja: ${sponsor.campaignUrl}'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: whiteColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.campaign, size: 20),
                            const SizedBox(width: 8),
                            const Text(
                              'Pogledaj kampanju',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  
                  // End date information
                  if (sponsor.endedAt != null) ...[
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.event_busy,
                            size: 16,
                            color: Colors.red.shade600,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Sponzorstvo završeno: ${_formatDate(sponsor.endedAt!)}',
                            style: TextStyle(
                              fontSize: 12,
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

          // Projects Section
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
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
                  Row(
                    children: [
                      Icon(
                        Icons.assignment,
                        color: primaryColor,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Projekti sponzora',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Projects List
                  if (projectsData.isEmpty) 
                    Container(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Icon(
                            Icons.assignment_outlined,
                            size: 48,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Nema dostupnih projekata',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Ovaj sponzor trenutno ne podržava nijedan projekat.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  else
                    Column(
                      children: projectsData.map((projectData) => 
                        _ProjectCard(projectData: projectData as Map<String, dynamic>)
                      ).toList(),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    const Color primaryColor = Color(0xFFf08a6e);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
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
              child: Text(
                '$label $value',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
            Icon(
              Icons.touch_app,
              size: 18,
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}.${date.month}.${date.year}';
  }
}

class _ProjectCard extends StatelessWidget {
  final Map<String, dynamic> projectData;

  const _ProjectCard({required this.projectData});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFf08a6e);
    const Color secondaryColor = Color(0xFF2c3e50);

    final id = projectData['id'] as int;
    final title = projectData['title'] as String? ?? '';
    final description = projectData['description'] as String? ?? '';
    final status = projectData['status'] as String? ?? '';
    final upvotes = projectData['upvotes'] as int? ?? 0;
    final maxUsers = projectData['max_users'] as int? ?? 0;
    final district = projectData['district'] as String? ?? '';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to project detail screen
          context.push('/projects/$id');
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: secondaryColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (district.isNotEmpty) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      district,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(status).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _getStatusColor(status).withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      _getStatusTextSr(status),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _getStatusColor(status),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.thumb_up_outlined,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        upvotes.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.group_outlined,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Max: $maxUsers',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'inactive':
        return Colors.grey;
      case 'completed':
        return Colors.blue;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _getStatusTextSr(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return 'Aktivno';
      case 'inactive':
        return 'Neaktivno';
      case 'completed':
        return 'Završeno';
      case 'pending':
        return 'Na čekanju';
      default:
        return status.toUpperCase();
    }
  }
} 