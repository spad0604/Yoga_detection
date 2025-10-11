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
        padding: const EdgeInsets.only(right: 8),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightCyan,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.cyan,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image.network(
                  fit: BoxFit.cover,
                  item.imageUrl ??
                      'https://static.wikia.nocookie.net/wiki-shincau-be-but-chi/images/8/8b/8264.jpg/revision/latest?cb=20160521113814&path-prefix=vi',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          item.name,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        '${item.totalMinutes?.toString() ?? '0'} mins     ${item.level ?? 'Beginner'}',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
                      ),
                    ]),
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
