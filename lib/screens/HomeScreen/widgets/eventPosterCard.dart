import 'package:flutter/material.dart';

import '../../../core/constants/app_Colors.dart';
import '../../EventsScreen/DetailsEventScreen/widgets/attendeesRow.dart';
import '../models/homeEventModel.dart';
import 'attendeesAvatarStack.dart';



class EventPosterCard extends StatelessWidget {
  final HomeEventModel event;
  final VoidCallback? onTap;
  final VoidCallback? onBookmarkTap;
  final double width;

  const EventPosterCard({
    super.key,
    required this.event,
    this.onTap,
    this.onBookmarkTap,
    this.width = 170,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin: const EdgeInsets.only(right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 130,
                    width: width,
                    color: event.imageBgColor,
                    child: Image.asset(
                      event.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                      const Icon(Icons.image, color: Colors.white54),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          event.dateDay,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.homeCardBg,
                          ),
                        ),
                        Text(
                          event.dateMonth,
                          style: const TextStyle(fontSize: 9, color: AppColors.homeCardBg),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: onBookmarkTap,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(7.0)
                      ),
                      child: Icon(
                        event.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        size: 16,
                        color: AppColors.homeCardBg,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              event.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            AttendeesAvatarStack(
              avatarUrls: event.attendeeAvatars,
              extraCount: event.extraGoingCount,
            ),
            if (event.location != null) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 13, color: Colors.grey),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      event.location!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}