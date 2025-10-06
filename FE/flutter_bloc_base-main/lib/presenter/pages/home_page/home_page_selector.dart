import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_bloc.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_state.dart';

class HomePageStatusSelector
    extends BlocSelector<HomePageBloc, HomePageState, HomePageStatus> {
  HomePageStatusSelector({
    required Widget Function(HomePageStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class HomePageStatusListener extends BlocListener<HomePageBloc, HomePageState> {
  HomePageStatusListener({
    required Iterable<HomePageStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
