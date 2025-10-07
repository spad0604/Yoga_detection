part of 'home_page.dart';

class YogaPosesItem extends StatelessWidget {
  String code;
  String title;
  String totalTime;
  String level;
  String imageUrl;
  YogaPosesItem({
    super.key,
    required this.code,
    required this.title,
    required this.totalTime,
    required this.level,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomePageBloc>().add(HomePageFetchYogaPoses(code));
        context.router.push(PoseDetailsRoute());
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
                  imageUrl,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '$totalTime mins     $level',
                    style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
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
