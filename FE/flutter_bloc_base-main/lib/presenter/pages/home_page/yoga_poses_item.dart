part of 'home_page.dart';

class YogaPosesItem extends StatelessWidget {
  final YogaPoseDetails item;
  const YogaPosesItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(PoseDetailsRoute(item: item));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightCyan,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 84, // Reduced from 100
              height: 84, // Reduced from 100
              decoration: BoxDecoration(
                color: AppColors.cyan,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image.network(
                  fit: BoxFit.cover,
                  item.imageUrl ??
                      'https://static.wikia.nocookie.net/wiki-shincau-be-but-chi/images/8/8b/8264.jpg/revision/latest?cb=20160521113814&path-prefix=vi',
                  width: 84,
                  height: 84,
                ),
              ),
            ),
            Expanded(
              // Use Expanded instead of fixed width
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        item.name,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        '${item.totalMinutes?.toString() ?? '0'} mins • ${item.level ?? 'Beginner'}',
                        style: const TextStyle(
                            fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400),
                      ),
                    ]),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.black,
            ),
            const SizedBox(width: 8), // Add some spacing at the end
          ],
        ),
      ),
    );
  }
}
