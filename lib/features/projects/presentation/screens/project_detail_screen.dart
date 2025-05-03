import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/project.dart';
import '../providers/project_provider.dart';

class ProjectDetailScreen extends ConsumerWidget {
  final int projectId;

  const ProjectDetailScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectAsyncValue = ref.watch(projectDetailProvider(projectId));

    // EXACT same colors as other screens
    const Color primaryColor = Color(0xFFf08a6e); // --primary
    const Color secondaryColor = Color(0xFF2c3e50); // --secondary
    const Color lightColor = Color(0xFFf9f7f4); // --light
    const Color whiteColor = Colors.white;

    return Scaffold(
      backgroundColor: lightColor,
      body: projectAsyncValue.when(
        data: (project) => _buildContent(context, ref, project),
        loading: () => Container(
          color: lightColor,
          child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              strokeWidth: 3,
            ),
          ),
        ),
        error: (error, stackTrace) => Container(
          color: lightColor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      border: Border.all(color: Colors.red.shade200),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.red.shade600,
                          size: 56,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Greška pri učitavanju',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.red.shade700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Došlo je do greške prilikom učitavanja projekta.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red.shade600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => ref.invalidate(projectDetailProvider(projectId)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: whiteColor,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    icon: const Icon(Icons.refresh, size: 20),
                    label: const Text(
                      'Pokušajte ponovo',
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
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, Project project) {
    // EXACT same colors as other screens
    const Color primaryColor = Color(0xFFf08a6e);
    const Color secondaryColor = Color(0xFF2c3e50);
    const Color lightColor = Color(0xFFf9f7f4);
    const Color whiteColor = Colors.white;

    final currencyFormat = NumberFormat.currency(
      locale: 'sr_RS',
      symbol: 'RSD ',
      decimalDigits: 0,
    );
    final dateFormat = DateFormat('dd.MM.yyyy');

    // Helper function to construct the full image URL
    String getFullImageUrl(String? imageUrl) {
      if (imageUrl == null || imageUrl.isEmpty) return '';
      
      if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
        return imageUrl;
      }
      
      String cleanImageUrl = imageUrl.startsWith('/') ? imageUrl.substring(1) : imageUrl;
      return 'https://mvpsrbije.com/$cleanImageUrl';
    }

    // Helper function to get Serbian status text
    String getStatusTextSr(String status) {
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

    Color getStatusColor(String status) {
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

    final fullImageUrl = getFullImageUrl(project.projectUrl);
    final daysRemaining = project.endDate.difference(DateTime.now()).inDays;

    return CustomScrollView(
      slivers: [
        // Hero App Bar with Image
        SliverAppBar(
          expandedHeight: 280,
          pinned: true,
          backgroundColor: secondaryColor,
          iconTheme: const IconThemeData(color: whiteColor),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh, color: whiteColor),
              onPressed: () => ref.invalidate(projectDetailProvider(projectId)),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                // Background Image or Gradient
                if (fullImageUrl.isNotEmpty)
                  Image.network(
                    fullImageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            primaryColor.withOpacity(0.8),
                            primaryColor.withOpacity(0.6),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          primaryColor.withOpacity(0.8),
                          primaryColor.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                
                // Dark overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                
                // Content
                Positioned(
                  bottom: 60,
                  left: 24,
                  right: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: getStatusColor(project.status),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          getStatusTextSr(project.status),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: whiteColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      // Title
                      Text(
                        project.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: whiteColor,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      
                      // Quick Info Row
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 16,
                            color: whiteColor.withOpacity(0.9),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Završetak: ${dateFormat.format(project.endDate)}',
                            style: TextStyle(
                              fontSize: 14,
                              color: whiteColor.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.group_outlined,
                            size: 16,
                            color: whiteColor.withOpacity(0.9),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${project.minUsers}-${project.maxUsers} volontera',
                            style: TextStyle(
                              fontSize: 14,
                              color: whiteColor.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
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
        ),

        // Content
        SliverToBoxAdapter(
          child: Container(
            color: lightColor,
                              child: Column(
                    children: [
                      // Main Content Cards
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // Action Buttons Card - Show at top if user is involved
                            if (project.isUserVolunteer == true) ...[
                              _buildActionButtonsCard(context, ref, project, primaryColor, secondaryColor, whiteColor),
                              const SizedBox(height: 16),
                            ],
                            
                            // Description Card
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(24),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: primaryColor.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Icon(
                                          Icons.description_outlined,
                                          color: primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      const Text(
                                        'Opis projekta',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    project.description,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                      height: 1.6,
                                    ),
                                  ),
                                  if (project.body != null && project.body!.isNotEmpty) ...[
                                    const SizedBox(height: 16),
                                    Text(
                                      project.body!,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[600],
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),

                      // Project Info Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.info_outline,
                                    color: primaryColor,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Informacije o projektu',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            
                            // Info Grid
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildInfoItem(
                                        context,
                                        Icons.calendar_today_outlined,
                                        'Početak',
                                        dateFormat.format(project.startDate),
                                      ),
                                    ),
                                    Expanded(
                                      child: _buildInfoItem(
                                        context,
                                        Icons.event_outlined,
                                        'Završetak',
                                        dateFormat.format(project.endDate),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildInfoItem(
                                        context,
                                        Icons.group_outlined,
                                        'Volonteri',
                                        '${project.minUsers}-${project.maxUsers}',
                                      ),
                                    ),
                                    Expanded(
                                      child: _buildInfoItem(
                                        context,
                                        Icons.star_outline,
                                        'Poeni',
                                        project.pointsEarned.toString(),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildInfoItem(
                                        context,
                                        Icons.attach_money_outlined,
                                        'Budžet',
                                        currencyFormat.format(double.tryParse(project.budget) ?? 0),
                                      ),
                                    ),
                                    Expanded(
                                      child: _buildInfoItem(
                                        context,
                                        Icons.timelapse,
                                        'Preostalo',
                                        daysRemaining > 0 ? '$daysRemaining dana' : 'Završen',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Organizer Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: primaryColor,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Organizator',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: project.organizer?.avatarUrl != null && project.organizer!.avatarUrl!.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(
                                            project.organizer!.avatarUrl!,
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) => Icon(
                                              Icons.person,
                                              size: 30,
                                              color: primaryColor,
                                            ),
                                          ),
                                        )
                                      : Icon(
                                          Icons.person,
                                          size: 30,
                                          color: primaryColor,
                                        ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${project.organizer?.firstName ?? 'Unknown'} ${project.organizer?.lastName ?? 'User'}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: secondaryColor,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '@${project.organizer?.username ?? 'unknown'}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Action Buttons Card - Show at bottom if user is NOT involved
                      if (project.isUserVolunteer != true) ...[
                        _buildActionButtonsCard(context, ref, project, primaryColor, secondaryColor, whiteColor),
                        const SizedBox(height: 16),
                      ],

                      // Voting Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.how_to_vote_outlined,
                                    color: primaryColor,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Glasanje',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            
                            Row(
                              children: [
                                Expanded(
                                  child: _buildVoteButton(
                                    context,
                                    ref,
                                    project,
                                    'up',
                                    Icons.thumb_up_outlined,
                                    project.upvotes,
                                    Colors.green,
                                    'Pozitivno',
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildVoteButton(
                                    context,
                                    ref,
                                    project,
                                    'down',
                                    Icons.thumb_down_outlined,
                                    project.downvotes,
                                    Colors.red,
                                    'Negativno',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(BuildContext context, IconData icon, String label, String value) {
    const Color primaryColor = Color(0xFFf08a6e);
    const Color secondaryColor = Color(0xFF2c3e50);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: primaryColor,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: secondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildVoteButton(
    BuildContext context,
    WidgetRef ref,
    Project project,
    String type,
    IconData icon,
    int count,
    Color color,
    String label,
  ) {
    const Color whiteColor = Colors.white;
    
    return ElevatedButton(
      onPressed: () => _handleVote(context, ref, project.id, type),
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: BorderSide(color: color.withOpacity(0.3)),
        elevation: 0,
      ),
      child: Column(
        children: [
          Icon(icon, size: 24),
          const SizedBox(height: 8),
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleVolunteer(BuildContext context, WidgetRef ref, int projectId) async {
    try {
      final message = await ref.read(projectsProvider.notifier).volunteer(projectId);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    } catch (e) {
      _showErrorSnackBar(context, e, 'Neuspešno pridruživanje kao volonter');
    }
  }

  Future<void> _handleBecomeLeader(BuildContext context, WidgetRef ref, int projectId) async {
    try {
      final message = await ref.read(projectsProvider.notifier).becomeLeader(projectId);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    } catch (e) {
      _showErrorSnackBar(context, e, 'Neuspešno postavljanje za lidera');
    }
  }

  Future<void> _handleVote(BuildContext context, WidgetRef ref, int projectId, String type) async {
    try {
      // Just call the vote method - no notification needed
      await ref.read(projectsProvider.notifier).vote(projectId, type);
      // The provider invalidation will automatically update the UI
    } catch (e) {
      // Only show error if something goes wrong
      _showErrorSnackBar(context, e, 'Neuspešno glasanje');
    }
  }

  void _showErrorSnackBar(BuildContext context, Object error, String fallbackMessage) {
    String errorMessage = fallbackMessage;
    if (error is DioException && error.response?.data is Map) {
      errorMessage = error.response!.data['message'] ?? fallbackMessage;
    } else {
      errorMessage = error.toString();
    }
    
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }
  }

  Widget _buildActionButtonsCard(
    BuildContext context,
    WidgetRef ref,
    Project project,
    Color primaryColor,
    Color secondaryColor,
    Color whiteColor,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.volunteer_activism,
                  color: primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Akcije',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // Check if user is already part of project
          if (project.isUserVolunteer == true) ...[
            // User is already a volunteer/leader
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Deo ste tima',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Pristupite projektu za komunikaciju sa timom',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => context.push('/volunteer-project/${project.id}'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: whiteColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                icon: const Icon(Icons.open_in_new, size: 20),
                label: const Text(
                  'Pristupite projektu',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ] else ...[
            // User is not part of project yet
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _handleVolunteer(context, ref, project.id),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: whiteColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    icon: const Icon(Icons.volunteer_activism, size: 20),
                    label: const Text(
                      'Pridruži se kao volonter',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _handleBecomeLeader(context, ref, project.id),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: whiteColor,
                      foregroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide(color: primaryColor, width: 2),
                      elevation: 0,
                    ),
                    icon: const Icon(Icons.leaderboard, size: 20),
                    label: const Text(
                      'Postani lider',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
