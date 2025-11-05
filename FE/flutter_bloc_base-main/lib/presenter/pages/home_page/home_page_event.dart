import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'home_page_event.freezed.dart';

@freezed
class HomePageEvent with _$HomePageEvent {
  const factory HomePageEvent.errorOccurred([BaseException? error]) = HomePageErrorOccurred;

  const factory HomePageEvent.started() = HomePageStarted;

  const factory HomePageEvent.fetchYogaPoses(String code) = HomePageFetchYogaPoses;
  
  const factory HomePageEvent.loadMore() = HomePageLoadMore;
}
