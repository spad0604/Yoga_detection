import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/data/entities/response/user_yoga_pose_model.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class PoseResultPage extends StatelessWidget {
  final UserYogaPoseModel result;
  final String? poseName;

  const PoseResultPage({super.key, required this.result, this.poseName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final score = result.score ?? 0;
    final displayPoseName = poseName ?? result.poseCode;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(LocaleKeys.PoseResult.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              final text =
                  'Mình vừa luyện tập tư thế "$displayPoseName" và đạt ${score.toStringAsFixed(0)} điểm!';
              final url = result.imageUrl;
              if (url != null && url.isNotEmpty) {
                await Share.share('$text\n$url');
              } else {
                await Share.share(text);
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (result.imageUrl != null && result.imageUrl!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.network(
                    result.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              displayPoseName,
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.emoji_events, color: Colors.amber, size: 28),
                  const SizedBox(width: 12),
                  Text(
                    'Điểm số: ${score.toStringAsFixed(0)}',
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Nhận xét',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                result.feedback ?? 'Không có nhận xét',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => context.router.maybePop(),
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Xong'),
            )
          ],
        ),
      ),
    );
  }
}
