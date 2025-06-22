import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/models/simple_project_request.dart';
import '../providers/simple_project_request_provider.dart';

class ProjectRequestDetailScreen extends ConsumerWidget {
  final int requestId;

  const ProjectRequestDetailScreen({
    super.key,
    required this.requestId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestAsync = ref.watch(projectRequestProvider(requestId));

    // Colors
    const Color primaryColor = Color(0xFFf08a6e);
    const Color secondaryColor = Color(0xFF2c3e50);
    const Color lightColor = Color(0xFFf9f7f4);
    const Color whiteColor = Colors.white;

    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        foregroundColor: whiteColor,
        title: const Text(
          'Detalji zahteva',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: whiteColor),
            onPressed: () => ref.invalidate(projectRequestProvider(requestId)),
          ),
        ],
      ),
      body: requestAsync.when(
        data: (request) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status and Date Card
              _buildStatusCard(context, request),
              const SizedBox(height: 16),

              // Title and Description Card
              _buildInfoCard(
                context,
                title: 'Osnovne informacije',
                children: [
                  _buildInfoRow('Naslov', request.title),
                  const SizedBox(height: 16),
                  _buildInfoSection('Opis', request.description),
                ],
              ),
              const SizedBox(height: 16),

              // Project Details Card
              _buildInfoCard(
                context,
                title: 'Detalji projekta',
                children: [
                  _buildInfoRow('Opština', request.district?.name ?? 'Nepoznata'),
                  if (request.startDate != null) ...[
                    const SizedBox(height: 12),
                    _buildInfoRow('Početak', DateFormat('dd.MM.yyyy').format(request.startDate!)),
                  ],
                  if (request.endDate != null) ...[
                    const SizedBox(height: 12),
                    _buildInfoRow('Završetak', DateFormat('dd.MM.yyyy').format(request.endDate!)),
                  ],
                  if (request.minUsers != null || request.maxUsers != null) ...[
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      'Broj učesnika',
                      '${request.minUsers ?? 'Neograničeno'} - ${request.maxUsers ?? 'Neograničeno'}',
                    ),
                  ],
                  if (request.budget != null && request.budget!.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _buildInfoRow('Budžet', request.budget!),
                  ],
                ],
              ),

              // Media Gallery
              if (request.media != null && request.media!.isNotEmpty) ...[
                const SizedBox(height: 16),
                _buildMediaGallery(context, request.media!),
              ],

              // Timestamps Card
              const SizedBox(height: 16),
              _buildInfoCard(
                context,
                title: 'Vremenske oznake',
                children: [
                  _buildInfoRow(
                    'Poslato',
                    DateFormat('dd.MM.yyyy HH:mm').format(request.createdAt),
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow(
                    'Poslednja izmena',
                    DateFormat('dd.MM.yyyy HH:mm').format(request.updatedAt),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          ),
        ),
        error: (error, stack) => _buildErrorState(context, error.toString(), () {
          ref.invalidate(projectRequestProvider(requestId));
        }),
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context, ProjectRequestResponse request) {
    const Color whiteColor = Colors.white;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
      child: Column(
        children: [
          _buildStatusBadge(request.status, large: true),
          const SizedBox(height: 16),
          Text(
            request.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2c3e50),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Poslato ${DateFormat('dd.MM.yyyy').format(request.createdAt)}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    const Color whiteColor = Colors.white;
    const Color secondaryColor = Color(0xFF2c3e50);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: secondaryColor,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF2c3e50),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF2c3e50),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildMediaGallery(BuildContext context, List<String> mediaUrls) {
    const Color whiteColor = Colors.white;
    const Color secondaryColor = Color(0xFF2c3e50);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.photo_library_outlined,
                color: secondaryColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Medijski fajlovi (${mediaUrls.length})',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: mediaUrls.length,
            itemBuilder: (context, index) {
              return _buildMediaItem(context, mediaUrls[index], index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMediaItem(BuildContext context, String mediaUrl, int index) {
    return GestureDetector(
      onTap: () => _showMediaViewer(context, mediaUrl, index),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                mediaUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.broken_image_outlined,
                          color: Colors.grey,
                          size: 32,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Greška pri učitavanju',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },
              ),
              // Overlay with zoom icon
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.zoom_in,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMediaViewer(BuildContext context, String mediaUrl, int index) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.black,
        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                child: Image.network(
                  mediaUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image_outlined,
                            color: Colors.white,
                            size: 64,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Greška pri učitavanju slike',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status, {bool large = false}) {
    Color backgroundColor;
    Color textColor;
    String displayText;
    IconData icon;

    switch (status.toLowerCase()) {
      case 'pending':
        backgroundColor = Colors.orange.shade100;
        textColor = Colors.orange.shade700;
        displayText = 'Na čekanju';
        icon = Icons.hourglass_empty;
        break;
      case 'approved':
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade700;
        displayText = 'Odobreno';
        icon = Icons.check_circle_outline;
        break;
      case 'pre-approved':
        backgroundColor = Colors.lightGreen.shade100;
        textColor = Colors.lightGreen.shade700;
        displayText = 'Pregledano';
        icon = Icons.verified_outlined;
        break;
      case 'rejected':
        backgroundColor = Colors.red.shade100;
        textColor = Colors.red.shade700;
        displayText = 'Odbačeno';
        icon = Icons.cancel_outlined;
        break;
      case 'in_review':
        backgroundColor = Colors.blue.shade100;
        textColor = Colors.blue.shade700;
        displayText = 'U pregledu';
        icon = Icons.rate_review_outlined;
        break;
      default:
        backgroundColor = Colors.grey.shade100;
        textColor = Colors.grey.shade700;
        displayText = status;
        icon = Icons.help_outline;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: large ? 20 : 12,
        vertical: large ? 12 : 6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(large ? 25 : 20),
        border: Border.all(color: textColor.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: large ? 24 : 16,
            color: textColor,
          ),
          SizedBox(width: large ? 12 : 6),
          Text(
            displayText,
            style: TextStyle(
              fontSize: large ? 16 : 12,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error, VoidCallback onRetry) {
    const Color primaryColor = Color(0xFFf08a6e);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Greška pri učitavanju',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red[700],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: TextStyle(
                color: Colors.red[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
              ),
              child: const Text('Pokušajte ponovo'),
            ),
          ],
        ),
      ),
    );
  }
} 