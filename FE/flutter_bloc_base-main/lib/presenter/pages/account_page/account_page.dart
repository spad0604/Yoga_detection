import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_bloc.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Page Page'),
      ),
      body: const Center(
        child: Text('Account Page Page'),
      ),
    );
  }
}
