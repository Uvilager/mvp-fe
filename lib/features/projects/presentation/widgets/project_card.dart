import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mvp_fe/features/projects/domain/models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

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

  @override
  Widget build(BuildContext context) {
    // EXACT same colors as other screens
    const Color primaryColor = Color(0xFFf08a6e);
    const Color secondaryColor = Color(0xFF2c3e50);
    const Color whiteColor = Colors.white;

    final currencyFormat = NumberFormat.currency(
      locale: 'sr_RS',
      symbol: 'RSD ',
      decimalDigits: 0,
    );
    final dateFormat = DateFormat('dd.MM.yyyy');

    final fullImageUrl = _getFullImageUrl(project.projectUrl);

    // Calculate days remaining and progress
    final daysRemaining = project.endDate.difference(DateTime.now()).inDays;
    final totalDays = project.endDate.difference(project.startDate).inDays;
    final progress = totalDays > 0 ? (totalDays - daysRemaining) / totalDays : 0.0;
    final clampedProgress = progress.clamp(0.0, 1.0);

    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/projects/${project.id}'),
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Header Section
            Stack(
              children: [
                if (fullImageUrl.isNotEmpty)
                  Image.network(
                    fullImageUrl,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            primaryColor.withOpacity(0.2),
                            primaryColor.withOpacity(0.1),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.assignment,
                          size: 48,
                          color: primaryColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                  )
                else
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          primaryColor.withOpacity(0.2),
                          primaryColor.withOpacity(0.1),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.assignment,
                        size: 48,
                        color: primaryColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                
                // Status badge overlay
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: _getStatusColor(project.status).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      _getStatusTextSr(project.status),
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    project.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: secondaryColor,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  
                  // Description
                  Text(
                    project.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),

                  // Progress Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Napredak',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            '${(clampedProgress * 100).toInt()}%',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      LinearProgressIndicator(
                        value: clampedProgress,
                        minHeight: 4,
                        borderRadius: BorderRadius.circular(2),
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Info Row
                  Row(
                    children: [
                      _buildInfoChip(
                        Icons.group_outlined,
                        '${project.minUsers}-${project.maxUsers}',
                        'volontera',
                      ),
                      const SizedBox(width: 12),
                      _buildInfoChip(
                        Icons.star_outline,
                        project.pointsEarned.toString(),
                        'poena',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Date and Action Row
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 14,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Završetak: ${dateFormat.format(project.endDate)}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.timelapse,
                                  size: 14,
                                  color: daysRemaining > 7 ? Colors.green : Colors.orange,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  daysRemaining > 0 
                                    ? 'Preostalo: $daysRemaining dana'
                                    : 'Završen',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: daysRemaining > 7 ? Colors.green : Colors.orange,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () => context.push('/projects/${project.id}'),
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: whiteColor,
                            size: 18,
                          ),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String value, String label) {
    const Color primaryColor = Color(0xFFf08a6e);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: primaryColor,
          ),
          const SizedBox(width: 4),
          Text(
            '$value $label',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
        ],
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
}
