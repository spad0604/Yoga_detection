import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_bloc.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_event.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_state.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
part 'menu_item.dart';

// TODO: Add the page to the router
@RoutePage()
class AccountPagePage extends StatefulWidget implements AutoRouteWrapper {
  const AccountPagePage();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AccountPageBloc>(
      create: (ctx) => provider.get<AccountPageBloc>(),
      child: this,
    );
  }

  @override
  State<AccountPagePage> createState() => _AccountPagePageState();
}

class _AccountPagePageState extends State<AccountPagePage> {
  AccountPageBloc get _bloc => context.read<AccountPageBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.add(AccountPageEvent.getInformation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: BlocBuilder<AccountPageBloc, AccountPageState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const CircleAvatar(
                      maxRadius: 45,
                    ),
                    const SizedBox(height: 40),
                    const Divider(color: Colors.black, thickness: 1),
                    const SizedBox(height: 40),
                    MenuItem(
                      title: 'Full Name',
                      iconPath: AppImages.ic_indentity,
                      text: ((state.information?.firstName ?? '').isEmpty &&
                              (state.information?.lastName ?? '').isEmpty)
                          ? 'Nguyen Van A'
                          : '${state.information?.firstName ?? ''} ${state.information?.lastName ?? ''}'
                              .trim(),
                      onTap: () {},
                    ),
                    MenuItem(
                      title: 'Email',
                      iconPath: AppImages.ic_mail,
                      text: state.information?.email ?? 'giapt2k29@cht.edu.vn',
                      onTap: () {},
                    ),
                    MenuItem(
                      title: 'Phone Number',
                      iconPath: AppImages.ic_phone,
                      text: '0975265932',
                      onTap: () {},
                    ),
                    MenuItem(
                      title: 'Birthday',
                      iconPath: AppImages.ic_phone,
                      text: '01/01/2000',
                      onTap: () {},
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
