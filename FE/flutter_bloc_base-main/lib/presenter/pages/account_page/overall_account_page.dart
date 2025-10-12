import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_bloc.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_event.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_state.dart';
import 'package:flutter_starter/presenter/pages/account_page/logout_dialog.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';

part 'overall_item.dart';

@RoutePage()
class OverallAccountPage extends StatefulWidget implements AutoRouteWrapper {
  const OverallAccountPage();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AccountPageBloc>(
      create: (ctx) => provider.get<AccountPageBloc>(),
      child: this,
    );
  }

  @override
  State<OverallAccountPage> createState() => _OverallAccountPageState();
}

class _OverallAccountPageState extends State<OverallAccountPage> {
  AccountPageBloc get _bloc => context.read<AccountPageBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(AccountPageEvent.getInformation());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountPageBloc, AccountPageState>(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Account',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 36),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.router.push(AccountRouteRoute());
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: AppColors.primaryBlue),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: AppColors.grey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_bloc.state.information?.firstName} ${_bloc.state.information?.lastName}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text(
                            '${_bloc.state.information?.email}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            context.router.push(AccountRouteRoute());
                          },
                          icon: Icon(Icons.arrow_forward))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    OverallItem(
                      iconPath: AppImages.ic_fill_indentity,
                      title: 'My Body',
                      onTap: () {},
                    ),
                    const SizedBox(height: 25),
                    OverallItem(
                      iconPath: AppImages.ic_fill_bell,
                      title: 'Notifications',
                      onTap: () {},
                    ),
                    const SizedBox(height: 25),
                    OverallItem(
                      iconPath: AppImages.ic_fill_setting,
                      title: 'Settings',
                      onTap: () {},
                    ),
                    const SizedBox(height: 25),
                    OverallItem(
                      iconPath: AppImages.ic_fill_help,
                      title: 'Help & Support',
                      onTap: () {},
                    ),
                    const SizedBox(height: 25),
                    OverallItem(
                      iconPath: AppImages.ic_fill_logout,
                      title: 'Log Out',
                      onTap: () async {
                        final shouldLogout = await showModalBottomSheet<bool>(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: SafeArea(
                              top: false,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: LogoutDialog(),
                              ),
                            ),
                          ),
                        );
                        if (shouldLogout == true) {
                          // TODO: implement real logout flow (clear tokens, navigate to login, etc.)
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
