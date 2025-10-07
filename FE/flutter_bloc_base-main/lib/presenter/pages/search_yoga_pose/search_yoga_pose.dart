import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page.dart';
import 'package:flutter_starter/presenter/pages/search_yoga_pose/search_yoga_pose_bloc.dart';
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
  SearchYogaPoseBloc get _bloc => context.read<SearchYogaPoseBloc>();

  final TextEditingController _searchController = TextEditingController();

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
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0, left: 8, right: 8),
                    child: YogaPosesItem(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaYRmvtTjbhBRv-BIbEfxFcWy4ZKwwscujrQ&s',
                      level: 'Beginner',
                      title: 'Mountain Pose',
                      totalTime: '5',
                    ),
                  );
                },
                itemCount: 100,
              ),
            )
          ],
        ));
  }
}
