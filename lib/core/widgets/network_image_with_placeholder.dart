import 'package:flutter/material.dart';

class NetworkImageWithPlaceholder extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const NetworkImageWithPlaceholder({
    super.key,
    this.imageUrl,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        color: Colors.grey[200],
        child: _shouldShowPlaceholder()
            ? _buildPlaceholder()
            : Image.network(
                imageUrl!,
                fit: fit,
                errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
      ),
    );
  }

  bool _shouldShowPlaceholder() {
    if (imageUrl == null || imageUrl!.isEmpty) return true;
    
    // Skip loading if URL is from example.com or placeholder.com
    final uri = Uri.tryParse(imageUrl!);
    if (uri == null) return true;
    
    final host = uri.host.toLowerCase();
    return host.contains('example.com') || 
           host.contains('placeholder.com') ||
           !host.contains('.');
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: const Icon(
        Icons.image_not_supported,
        color: Colors.grey,
        size: 40,
      ),
    );
  }
} 