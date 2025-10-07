import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:flutter_starter/data/usecases/get_list_yoga_poses_uc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page.dart';
import 'package:flutter_starter/presenter/pages/search_yoga_pose/search_yoga_pose_bloc.dart';
import 'package:flutter_starter/presenter/pages/search_yoga_pose/search_yoga_pose_event.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';

part 'search_text_field.dart';

// TODO: Add the page to the router
@RoutePage()
class SearchYogaPosePage extends StatefulWidget implements AutoRouteWrapper {
  const SearchYogaPosePage();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SearchYogaPoseBloc>(
      create: (ctx) => provider.get<SearchYogaPoseBloc>(),
      child: this,
    );
  }

  @override
  State<SearchYogaPosePage> createState() => _SearchYogaPosePageState();
}

class _SearchYogaPosePageState extends State<SearchYogaPosePage> {
  // page management handled by _currentPage

  SearchYogaPoseBloc get _bloc => context.read<SearchYogaPoseBloc>();

  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _debounce;
  int _currentPage = 1;
  final int _pageSize = 20;

  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    _scrollController.addListener(_onScroll);
    // initial load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dispatchSearch(keyword: '', page: 1);
    });
    super.initState();
  }

  void _onSearchChanged() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      _currentPage = 1;
      _dispatchSearch(keyword: _searchController.text.trim(), page: _currentPage);
    });
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final threshold = 200.0; // px from bottom
    final maxScroll = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;
    if (maxScroll - current <= threshold) {
      // load next page
      if (!_bloc.state.yogaPoses.isEmpty) {
        _currentPage += 1;
        _dispatchSearch(keyword: _searchController.text.trim(), page: _currentPage);
      }
    }
  }

  void _dispatchSearch({required String keyword, required int page}) {
    _bloc.add(SearchYogaPoseStarted(
        GetListYogaPosesParams(page: page, size: _pageSize, keyword: keyword)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Yoga Poses',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.black),
          ),
        ),
        body: Column(
          children: [
            SearchTextField(
              controller: _searchController,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  final items = _bloc.state.yogaPoses[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0, left: 8, right: 8),
                    child: YogaPosesItem(
                      code: items.code,
                      imageUrl: items.imageUrl,
                      level: items.level,
                      title: items.name,
                      totalTime: items.totalMinutes.toString(),
                    ),
                  );
                },
                itemCount: _bloc.state.yogaPoses.length,
              ),
            )
          ],
        ));
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.removeListener(_onSearchChanged);
    _scrollController.removeListener(_onScroll);
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
