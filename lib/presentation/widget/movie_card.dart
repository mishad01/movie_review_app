import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_review_app/core/app_colors.dart';
import 'package:movie_review_app/core/app_strings.dart';
import 'package:movie_review_app/domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie, required this.onTap});
  final Movie movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: .only(bottom: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            movie.posterPath != null
                ? ClipRRect(
                    borderRadius: .only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: '${AppStrings.imageBaseUrl}${movie.posterPath}',
                      width: 120,
                      height: 150,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SizedBox(
                        width: 100,
                        height: 150,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => SizedBox(
                        width: 100,
                        height: 150,
                        child: Icon(Icons.error, color: Colors.red),
                      ),
                    ),
                  )
                : SizedBox(
                    width: 100,
                    height: 150,
                    child: Container(
                      color: Colors.grey.shade600,
                      child: Icon(Icons.movie, size: 50),
                    ),
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.accent, size: 16),
                        SizedBox(width: 4),
                        Text(
                          movie.voteAverage.toStringAsFixed(1),
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      movie.releaseDate,
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
