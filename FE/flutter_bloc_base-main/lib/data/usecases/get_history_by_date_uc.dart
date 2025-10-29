import 'dart:async';

import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/user_yoga_pose_model.dart';
import 'package:flutter_starter/data/repositories/yoga_poses_repository/yoga_poses_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetHistoryByDateUC extends UseCase<PageResponse<UserYogaPoseModel>, GetHistoryByDateParams> {
  final YogaPosesRepository _historyRepository;

  GetHistoryByDateUC({required YogaPosesRepository historyRepository})
      : _historyRepository = historyRepository;

  @override
  FutureOr<PageResponse<UserYogaPoseModel>> call(params) {
    final res =
        _historyRepository.getUserYogaPosesByDate(params.page, params.startDate, params.endDate);

    return res;
  }
}

class GetHistoryByDateParams {
  final int page;
  final DateTime startDate;
  final DateTime endDate;

  GetHistoryByDateParams({required this.page, required this.startDate, required this.endDate});
}
