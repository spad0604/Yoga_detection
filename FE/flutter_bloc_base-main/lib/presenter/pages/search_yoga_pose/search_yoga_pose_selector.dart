import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/presenter/pages/search_yoga_pose/search_yoga_pose_bloc.dart';
import 'package:flutter_starter/presenter/pages/search_yoga_pose/search_yoga_pose_state.dart';

class SearchYogaPoseStatusSelector
    extends BlocSelector<SearchYogaPoseBloc, SearchYogaPoseState, SearchYogaPoseStatus> {
  SearchYogaPoseStatusSelector({
    required Widget Function(SearchYogaPoseStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class SearchYogaPoseStatusListener extends BlocListener<SearchYogaPoseBloc, SearchYogaPoseState> {
  SearchYogaPoseStatusListener({
    required Iterable<SearchYogaPoseStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
