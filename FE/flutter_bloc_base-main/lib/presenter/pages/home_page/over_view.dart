part of 'home_page.dart';

class OverView extends StatelessWidget {
  String totalSessions = '12';
  OverView({super.key, this.totalSessions = '12'});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cyan,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.only(top: 29, left: 25, right: 54, bottom: 41),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overview',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Sessions',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
              )
            ],
          ),
          Spacer(),
          Text(
            totalSessions,
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}
