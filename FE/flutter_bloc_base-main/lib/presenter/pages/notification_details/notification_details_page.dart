import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/data/entities/response/notification_response.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/presenter/themes/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';

@RoutePage()
class NotificationDetailsPage extends StatelessWidget {
  final NotificationResponse notification;

  const NotificationDetailsPage({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(LocaleKeys.NotificationDetails.tr()),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image section (if available)
            if (notification.imageUrl != null && notification.imageUrl!.isNotEmpty)
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: AppColors.primaryPurple.withOpacity(0.05),
                ),
                child: Image.network(
                  notification.imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _buildPlaceholderImage(),
                ),
              ),

            // Content section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Type badge
                  if (notification.type != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _getTypeColor(notification.type!).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _getTypeColor(notification.type!).withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _getTypeIcon(notification.type!),
                            size: 16,
                            color: _getTypeColor(notification.type!),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _getTypeLabel(notification.type!),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: _getTypeColor(notification.type!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Title
                  Text(
                    notification.normalTitle,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Date info
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        notification.createdAt.dateTimeToDayMonDay(),
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${notification.createdAt.hour.toString().padLeft(2, '0')}:${notification.createdAt.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Body content
                  if (notification.normalBody != null && notification.normalBody!.isNotEmpty) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.primaryPurpleLight.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.border,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        notification.normalBody!,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textPrimary,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],

                  // Action button based on type
                  if (notification.type != null && notification.referenceId != null) ...[
                    const SizedBox(height: 24),
                    _buildActionButton(context),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      color: AppColors.primaryPurple.withOpacity(0.1),
      child: Center(
        child: Icon(
          Icons.notifications_active,
          size: 80,
          color: AppColors.primaryPurple.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    String buttonText = LocaleKeys.ViewDetails.tr();
    IconData buttonIcon = Icons.arrow_forward;

    switch (notification.type) {
      case 'POSE_RESULT':
        buttonText = LocaleKeys.ViewResults.tr();
        buttonIcon = Icons.self_improvement;
        break;
      case 'SOCIAL':
        buttonText = LocaleKeys.ViewPost.tr();
        buttonIcon = Icons.article;
        break;
      case 'ROUTINE_REMINDER':
        buttonText = LocaleKeys.StartPractice.tr();
        buttonIcon = Icons.play_arrow;
        break;
      default:
        buttonText = LocaleKeys.ViewDetails.tr();
        buttonIcon = Icons.arrow_forward;
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          _handleActionTap(context);
        },
        icon: Icon(buttonIcon),
        label: Text(buttonText),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryPurple,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  void _handleActionTap(BuildContext context) {
    // Navigate based on notification type and referenceId
    switch (notification.type) {
      case 'POSE_RESULT':
        // Navigate to pose attempt details
        // context.router.push(PoseAttemptDetailsRoute(attemptId: notification.referenceId!));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(LocaleKeys.NavigateToPoseResult.tr(
                  namedArgs: {'id': notification.referenceId ?? ''}))),
        );
        break;
      case 'SOCIAL':
        // Navigate to social post
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  LocaleKeys.NavigateToPost.tr(namedArgs: {'id': notification.referenceId ?? ''}))),
        );
        break;
      case 'ROUTINE_REMINDER':
        // Navigate to routine
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(LocaleKeys.NavigateToRoutine.tr(
                  namedArgs: {'id': notification.referenceId ?? ''}))),
        );
        break;
      default:
        break;
    }
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'POSE_RESULT':
        return Colors.green;
      case 'SOCIAL':
        return Colors.blue;
      case 'ROUTINE_REMINDER':
        return Colors.orange;
      case 'SYSTEM':
        return Colors.purple;
      default:
        return AppColors.primaryPurple;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'POSE_RESULT':
        return Icons.self_improvement;
      case 'SOCIAL':
        return Icons.people;
      case 'ROUTINE_REMINDER':
        return Icons.access_time;
      case 'SYSTEM':
        return Icons.settings;
      default:
        return Icons.notifications;
    }
  }

  String _getTypeLabel(String type) {
    switch (type) {
      case 'POSE_RESULT':
        return 'Kết quả tập luyện';
      case 'SOCIAL':
        return 'Hoạt động xã hội';
      case 'ROUTINE_REMINDER':
        return 'Nhắc nhở';
      case 'SYSTEM':
        return 'Hệ thống';
      default:
        return type;
    }
  }
}
