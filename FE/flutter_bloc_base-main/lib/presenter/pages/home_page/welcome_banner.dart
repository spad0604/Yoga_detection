part of 'home_page.dart';

class WelcomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.teal,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
          padding: const EdgeInsets.only(top: 35.0, left: 20, bottom: 45),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, User',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Are you ready for yoga\n exercise?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 34),
                  Row(
                    children: [
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.5),
                          backgroundColor: AppColors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48.0),
                          ),
                        ),
                        child: Text('Begin', style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
