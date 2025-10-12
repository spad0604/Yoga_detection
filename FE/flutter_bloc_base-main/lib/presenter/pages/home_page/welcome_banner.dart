part of 'home_page.dart';

class WelcomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = context.read<AccountPageBloc>();

    return BlocBuilder<AccountPageBloc, AccountPageState>(
        bloc: _bloc,
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.teal,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, ${_bloc.state.information?.firstName ?? 'User'}',
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
                              context.router.push(const SearchYogaPoseRoute());
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.5),
                              backgroundColor: AppColors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48.0),
                              ),
                            ),
                            child:
                                Text('Begin', style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(),
                Image.asset(
                  AppImages.banner_image,
                  height: 140.h,
                )
              ],
            ),
          );
        });
  }
}
