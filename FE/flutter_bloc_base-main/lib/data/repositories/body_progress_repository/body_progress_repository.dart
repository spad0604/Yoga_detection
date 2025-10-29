import 'package:flutter_starter/data/entities/request/create_body_progress_request.dart';
import 'package:flutter_starter/data/entities/request/update_body_progress_request.dart';
import 'package:flutter_starter/data/entities/response/body_progress_response.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';

abstract class BodyProgressRepository {
  // Create
  Future<BodyProgressResponse> createBodyProgress(CreateBodyProgressRequest request);
  
  // Update
  Future<BodyProgressResponse> updateBodyProgress(String id, UpdateBodyProgressRequest request);
  
  // Delete
  Future<void> deleteBodyProgress(String id);
  
  // Get
  Future<BodyProgressResponse> getBodyProgressById(String id);
  
  // List with pagination
  Future<PageResponse<BodyProgressResponse>> getUserBodyProgress(int page, int size);
  
  // Get all (no pagination)
  Future<List<BodyProgressResponse>> getAllUserBodyProgress();
  
  // Get latest
  Future<BodyProgressResponse> getLatestBodyProgress();
  
  // Get by date range
  Future<List<BodyProgressResponse>> getBodyProgressByDateRange(DateTime startDate, DateTime endDate);
}

