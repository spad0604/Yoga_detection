part of 'history.dart';

class _SessionHistoryCard extends StatelessWidget {
  final PracticeSession session;

  const _SessionHistoryCard({required this.session});

  @override
  Widget build(BuildContext context) {
    final completedCount = session.allPoses.where((p) => p.isCompleted).length;
    final totalCount = session.allPoses.length;
    final completionRate = totalCount > 0 ? (completedCount / totalCount * 100).toInt() : 0;

    return InkWell(
      onTap: () {
        // Navigate to session summary page
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PracticeSessionSummaryPage(
              session: session,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientPurple.map((c) => c.withOpacity(0.05)).toList(),
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primaryPurple.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with routine name and status
            Row(
              children: [
                Expanded(
                  child: Text(
                    session.routineName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                _StatusBadge(status: session.status),
              ],
            ),

            const SizedBox(height: 12),

            // Stats row
            Row(
              children: [
                _StatItem(
                  icon: Icons.star,
                  label: 'Score',
                  value: session.averageScore.toStringAsFixed(1),
                  color: _getScoreColor(session.averageScore),
                ),
                const SizedBox(width: 16),
                _StatItem(
                  icon: Icons.timer,
                  label: 'Time',
                  value: _formatDuration(session.totalTimeSpentSeconds),
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 16),
                _StatItem(
                  icon: Icons.fitness_center,
                  label: 'Poses',
                  value: '$completedCount/$totalCount',
                  color: AppColors.textSecondary,
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: completedCount / totalCount,
                minHeight: 6,
                backgroundColor: AppColors.textSecondary.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getScoreColor(session.averageScore),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Date time
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 4),
                Text(
                  session.completedAt?.dateTimeToDayMonDay() ??
                      DateTime.now().dateTimeToDayMonDay(),
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                const Spacer(),
                Text(
                  '$completionRate% Complete',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _getScoreColor(session.averageScore),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes}m ${secs}s';
  }

  Color _getScoreColor(double score) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.orange;
    return Colors.red;
  }
}

class _StatusBadge extends StatelessWidget {
  final SessionStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;

    switch (status) {
      case SessionStatus.completed:
        color = Colors.green;
        text = 'Completed';
        break;
      case SessionStatus.inProgress:
        color = Colors.orange;
        text = 'In Progress';
        break;
      case SessionStatus.abandoned:
        color = Colors.red;
        text = 'Abandoned';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
