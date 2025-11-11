import 'dart:io';
import 'package:flutter_starter/data/entities/request/change_password.dart';
import 'package:flutter_starter/data/entities/request/google_login_params.dart';
import 'package:flutter_starter/data/entities/request/register_params.dart';
import 'package:flutter_starter/data/entities/request/request_change_password.dart';
import 'package:flutter_starter/data/entities/request/reset_password_request.dart';
import 'package:flutter_starter/data/entities/request/refresh_token_request.dart';
import 'package:flutter_starter/data/entities/request/create_group_request.dart';
import 'package:flutter_starter/data/entities/request/update_routine_progress_request.dart';
import 'package:flutter_starter/data/entities/request/create_body_progress_request.dart';
import 'package:flutter_starter/data/entities/request/update_body_progress_request.dart';
import 'package:flutter_starter/data/entities/request/verify_otp_request.dart';
import 'package:flutter_starter/data/entities/response/friend_response.dart';
import 'package:flutter_starter/data/entities/response/get_information.dart';
import 'package:flutter_starter/data/entities/response/user_activity_response.dart';
import 'package:flutter_starter/data/entities/response/yoga_group_response.dart';
import 'package:flutter_starter/data/entities/response/post_response.dart';
import 'package:flutter_starter/data/entities/response/comment_response.dart';
import 'package:flutter_starter/data/entities/response/notification_response.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/pose_history_attempts.dart';
import 'package:flutter_starter/data/entities/response/pose_statistics.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/data/entities/response/user_routine_progress.dart';
import 'package:flutter_starter/data/entities/response/user_yoga_pose_model.dart';
import 'package:flutter_starter/data/entities/response/body_progress_response.dart';
import 'package:flutter_starter/data/entities/response/verify_otp.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:flutter_starter/data/entities/response/yoga_routine.dart';
import 'package:flutter_starter/data/entities/response/practice_session.dart';
import 'package:flutter_starter/data/sources/network/base_api_response.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:flutter_starter/data/entities/request/login_params.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter_starter/data/sources/network/dio.dart';

part 'network.g.dart';

@singleton
@RestApi()
abstract class NetworkDataSource {
  @factoryMethod
  factory NetworkDataSource(NetworkDio dio) = _NetworkDataSource;

  @POST('api/auth/verify')
  Future<Account> verifyLoginStatus();

  @POST('api/auth/login')
  Future<BaseApiResponse<RegisterResponse>> login(@Body() LoginParams params);

  @POST('api/auth/google')
  Future<BaseApiResponse<RegisterResponse>> loginWithGoogle(@Body() GoogleLoginParams params);

  @POST('api/auth/register')
  Future<BaseApiResponse<RegisterResponse>> register(@Body() RegisterParams params);

  @POST('api/user/change')
  Future<BaseApiResponse<String>> changePassword(@Body() ChangePasswordRequest params);

  @POST('api/password/send-otp')
  Future<BaseApiResponse<String>> sendOtp(@Body() RequestChangePassword params);

  @POST('api/password/verify-otp')
  Future<BaseApiResponse<VerifyOtpResponse>> verifyOtp(@Body() VerifyOtpRequest params);

  @GET('api/yoga-poses')
  Future<BaseApiResponse<PageResponse<YogaPoseDetails>>> getYogaPoses(
      @Query('page') int page, @Query('pageSize') int size, @Query('keyWord') String keyword);

  @GET('api/yoga-poses/{code}')
  Future<BaseApiResponse<YogaPoseDetails>> getYogaPoseDetails(@Path('code') String code);

  @POST('api/password/reset')
  Future<BaseApiResponse<void>> resetPassword(@Body() ResetPasswordRequest params);

  @POST('api/auth/refresh')
  Future<BaseApiResponse<RegisterResponse>> refreshToken(@Body() RefreshTokenRequest params);

  @GET('api/user/me')
  Future<BaseApiResponse<GetInformation>> getInformation();

  @MultiPart()
  @PUT('api/user/profile')
  Future<BaseApiResponse<GetInformation>> updateProfile(@Body() FormData formData);

  @MultiPart()
  @POST('api/pose-attempts')
  Future<BaseApiResponse<UserYogaPoseModel>> postYogaPose(@Body() FormData formData);

  @GET("api/pose-attempts/by-date")
  Future<BaseApiResponse<PageResponse<UserYogaPoseModel>>> getUserYogaPosesByDate(
      @Query("page") int page,
      @Query("startDate") String startDate,
      @Query("endDate") String endDate);

  @GET('api/pose-attempts/{id}')
  Future<BaseApiResponse<UserYogaPoseModel>> getUserYogaPoseById(@Path('id') String id);

  @GET('api/pose-attempts/statistics/{poseCode}')
  Future<BaseApiResponse<PoseStatistics>> getPoseStatistics(@Path('poseCode') String poseCode);

  @GET('api/pose-attempts/by-pose/{poseCode}')
  Future<BaseApiResponse<PageResponse<PoseHistoryAttempts>>> getPoseAttemptsByPose(
    @Path('poseCode') String poseCode,
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );

  @GET('api/notifications')
  Future<BaseApiResponse<PageResponse<NotificationResponse>>> getNotifications(
      @Query('page') int page, @Query('size') int size);

  @GET('api/notifications/{id}')
  Future<BaseApiResponse<NotificationResponse>> getNotificationById(@Path('id') int id);

  @PUT('api/notifications/{id}/read')
  Future<BaseApiResponse<String>> markNotificationAsRead(@Path('id') int id);

  @PUT('api/notifications/read-all')
  Future<BaseApiResponse<String>> markAllNotificationsAsRead();

  @GET('api/notifications/unread-count')
  Future<BaseApiResponse<void>> getUnreadNotificationCount();

  // Routine APIs
  @GET('api/routines')
  Future<BaseApiResponse<PageResponse<YogaRoutine>>> getAllRoutines(
      @Query('page') int page, @Query('size') int size);

  @GET('api/routines/{id}')
  Future<BaseApiResponse<YogaRoutine>> getRoutineById(@Path('id') String id);

  @GET('api/routines/level/{level}')
  Future<BaseApiResponse<PageResponse<YogaRoutine>>> getRoutinesByLevel(
      @Path('level') String level, @Query('page') int page, @Query('size') int size);

  @GET('api/routines/search')
  Future<BaseApiResponse<PageResponse<YogaRoutine>>> searchRoutines(
      @Query('keyword') String keyword, @Query('page') int page, @Query('size') int size);

  @GET('api/routines/filter')
  Future<BaseApiResponse<PageResponse<YogaRoutine>>> filterRoutines({
    @Query('level') String? level,
    @Query('isPremium') bool? isPremium,
    @Query('page') required int page,
    @Query('size') required int size,
  });

  // Routine Progress APIs
  @POST('api/routines/progress/start/{routineId}')
  Future<BaseApiResponse<UserRoutineProgress>> startOrContinueRoutine(
      @Path('routineId') String routineId);

  @PUT('api/routines/progress/update')
  Future<BaseApiResponse<UserRoutineProgress>> updateRoutineProgress(
      @Body() UpdateRoutineProgressRequest request);

  @GET('api/routines/progress/{routineId}')
  Future<BaseApiResponse<UserRoutineProgress>> getRoutineProgress(
      @Path('routineId') String routineId);

  @GET('api/routines/progress/in-progress')
  Future<BaseApiResponse<PageResponse<UserRoutineProgress>>> getInProgressRoutines(
      @Query('page') int page, @Query('size') int size);

  @GET('api/routines/progress/completed')
  Future<BaseApiResponse<PageResponse<UserRoutineProgress>>> getCompletedRoutines(
      @Query('page') int page, @Query('size') int size);

  @DELETE('api/routines/progress/{routineId}')
  Future<BaseApiResponse<void>> resetRoutineProgress(@Path('routineId') String routineId);

  @GET('api/routines/progress/statistics')
  Future<BaseApiResponse<UserRoutineStatistics>> getUserRoutineStatistics();

// ========== Friends ==========
  @POST('api/social/friends/request')
  Future<BaseApiResponse<void>> sendFriendRequest(
    @Query('friendEmail') String friendEmail,
  );

  @POST('api/social/friends/accept/{friendshipId}')
  Future<BaseApiResponse<void>> acceptFriendRequest(
    @Path('friendshipId') String friendshipId,
  );

  @POST('api/social/friends/reject/{friendshipId}')
  Future<BaseApiResponse<void>> rejectFriendRequest(
    @Path('friendshipId') String friendshipId,
  );

  @DELETE('api/social/friends/{friendshipId}')
  Future<BaseApiResponse<void>> removeFriend(
    @Path('friendshipId') String friendshipId,
  );

  @GET('api/social/friends')
  Future<BaseApiResponse<PageResponse<FriendResponse>>> getFriends(
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('api/social/friends/pending')
  Future<BaseApiResponse<PageResponse<FriendResponse>>> getPendingFriendRequests(
    @Query('page') int page,
    @Query('size') int size,
  );

// ========== Groups ==========
  @POST('api/social/groups')
  Future<BaseApiResponse<YogaGroupResponse>> createGroup(
    @Body() CreateGroupRequest request,
  );

  @GET('api/social/groups/{id}')
  Future<BaseApiResponse<YogaGroupResponse>> getGroupById(
    @Path('id') String id,
  );

  @GET('api/social/groups')
  Future<BaseApiResponse<PageResponse<YogaGroupResponse>>> getPublicGroups(
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('api/social/groups/my')
  Future<BaseApiResponse<PageResponse<YogaGroupResponse>>> getMyGroups(
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('api/social/groups/search')
  Future<BaseApiResponse<PageResponse<YogaGroupResponse>>> searchGroups(
    @Query('keyword') String keyword,
    @Query('page') int page,
    @Query('size') int size,
  );

  @POST('api/social/groups/{groupId}/join')
  Future<BaseApiResponse<void>> joinGroup(
    @Path('groupId') String groupId,
  );

  @POST('api/social/groups/{groupId}/leave')
  Future<BaseApiResponse<void>> leaveGroup(
    @Path('groupId') String groupId,
  );

// ========== Activities ==========
  @GET('api/social/activities/friends')
  Future<BaseApiResponse<PageResponse<UserActivityResponse>>> getFriendActivities(
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('api/social/activities/me')
  Future<BaseApiResponse<PageResponse<UserActivityResponse>>> getMyActivities(
    @Query('page') int page,
    @Query('size') int size,
  );

  // ========== Group Posts (Feed) ==========
  @MultiPart()
  @POST('api/social/groups/{groupId}/posts')
  Future<BaseApiResponse<PostResponse>> createGroupPost(
    @Path('groupId') String groupId,
    @Body() FormData formData,
  );

  @GET('api/social/groups/{groupId}/posts')
  Future<BaseApiResponse<PageResponse<PostResponse>>> getGroupFeed(
    @Path('groupId') String groupId,
    @Query('page') int page,
    @Query('size') int size,
  );

  @POST('api/social/groups/{groupId}/posts/{postId}/likes')
  Future<BaseApiResponse<void>> likeGroupPost(
    @Path('groupId') String groupId,
    @Path('postId') String postId,
  );

  @POST('api/social/groups/{groupId}/posts/{postId}/unlike')
  Future<BaseApiResponse<void>> unlikeGroupPost(
    @Path('groupId') String groupId,
    @Path('postId') String postId,
  );

  @POST('api/social/groups/{groupId}/posts/{postId}/comments')
  Future<BaseApiResponse<CommentResponse>> createComment(
    @Path('groupId') String groupId,
    @Path('postId') String postId,
    @Body() Map<String, dynamic> request,
  );

  @GET('api/social/groups/{groupId}/posts/{postId}/comments')
  Future<BaseApiResponse<PageResponse<CommentResponse>>> getCommentsOfPost(
    @Path('groupId') String groupId,
    @Path('postId') String postId,
    @Query('page') int page,
    @Query('size') int size,
  );

  @DELETE('api/social/groups/{groupId}/posts/{postId}')
  Future<BaseApiResponse<void>> deleteGroupPost(
    @Path('groupId') String groupId,
    @Path('postId') String postId,
  );

  // ========== Social Posts (Public/Friends) ==========
  @MultiPart()
  @POST('api/social/posts')
  Future<BaseApiResponse<PostResponse>> createSocialPost(@Body() FormData formData);

  @GET('api/social/posts')
  Future<BaseApiResponse<PageResponse<PostResponse>>> getSocialFeed(
    @Query('page') int page,
    @Query('size') int size,
    @Query('scope') String scope,
  );

  @POST('api/social/posts/{postId}/likes')
  Future<BaseApiResponse<void>> likeSocialPost(@Path('postId') String postId);

  @POST('api/social/posts/{postId}/unlike')
  Future<BaseApiResponse<void>> unlikeSocialPost(@Path('postId') String postId);

  @POST('api/social/posts/{postId}/comments')
  Future<BaseApiResponse<CommentResponse>> createSocialComment(
    @Path('postId') String postId,
    @Body() Map<String, dynamic> request,
  );

  @GET('api/social/posts/{postId}/comments')
  Future<BaseApiResponse<PageResponse<CommentResponse>>> getSocialComments(
    @Path('postId') String postId,
    @Query('page') int page,
    @Query('size') int size,
  );

  @DELETE('api/social/posts/{postId}')
  Future<BaseApiResponse<void>> deleteSocialPost(@Path('postId') String postId);

  // Body Progress APIs
  @POST('api/body-progress')
  Future<BaseApiResponse<BodyProgressResponse>> createBodyProgress(
      @Body() CreateBodyProgressRequest request);

  @PUT('api/body-progress/{id}')
  Future<BaseApiResponse<BodyProgressResponse>> updateBodyProgress(
      @Path('id') String id, @Body() UpdateBodyProgressRequest request);

  @DELETE('api/body-progress/{id}')
  Future<BaseApiResponse<void>> deleteBodyProgress(@Path('id') String id);

  @GET('api/body-progress/{id}')
  Future<BaseApiResponse<BodyProgressResponse>> getBodyProgressById(@Path('id') String id);

  @GET('api/body-progress')
  Future<BaseApiResponse<PageResponse<BodyProgressResponse>>> getUserBodyProgress(
      @Query('page') int page, @Query('size') int size);

  @GET('api/body-progress/all')
  Future<BaseApiResponse<List<BodyProgressResponse>>> getAllUserBodyProgress();

  @GET('api/body-progress/latest')
  Future<BaseApiResponse<BodyProgressResponse>> getLatestBodyProgress();

  @GET('api/body-progress/range')
  Future<BaseApiResponse<List<BodyProgressResponse>>> getBodyProgressByDateRange(
      @Query('startDate') String startDate, @Query('endDate') String endDate);

  // Practice Session APIs
  @POST('api/practice-sessions/start')
  Future<BaseApiResponse<PracticeSession>> startPracticeSession(
      @Query('routineId') String routineId);

  @GET('api/practice-sessions/{sessionId}')
  Future<BaseApiResponse<PracticeSession>> getPracticeSession(@Path('sessionId') String sessionId);

  @MultiPart()
  @POST('api/practice-sessions/{sessionId}/submit-pose')
  Future<BaseApiResponse<PracticeSession>> submitPoseInSession({
    @Path('sessionId') required String sessionId,
    @Query('poseCode') required String poseCode,
    @Part(name: 'image') required File imageFile,
    @Query('timeSpentSeconds') int? timeSpentSeconds,
    @Query('landmarkData') String? landmarkData,
  });

  @POST('api/practice-sessions/{sessionId}/skip')
  Future<BaseApiResponse<PracticeSession>> skipPoseInSession(@Path('sessionId') String sessionId);

  @POST('api/practice-sessions/{sessionId}/complete')
  Future<BaseApiResponse<PracticeSession>> completePracticeSession(
      @Path('sessionId') String sessionId);

  @DELETE('api/practice-sessions/{sessionId}')
  Future<BaseApiResponse<void>> abandonPracticeSession(@Path('sessionId') String sessionId);

  @GET('api/practice-sessions/history')
  Future<BaseApiResponse<List<PracticeSession>>> getPracticeSessionHistory({
    @Query('startDate') String? startDate,
    @Query('endDate') String? endDate,
  });

  // ==================== ADMIN APIs ====================
  
  // Admin Yoga Pose Management
  @MultiPart()
  @POST('api/admin/yoga-poses')
  Future<BaseApiResponse<YogaPoseDetails>> adminCreateYogaPose(@Body() FormData formData);

  @MultiPart()
  @PUT('api/admin/yoga-poses/{code}')
  Future<BaseApiResponse<YogaPoseDetails>> adminUpdateYogaPose(
    @Path('code') String code,
    @Body() FormData formData,
  );

  @DELETE('api/admin/yoga-poses/{code}')
  Future<BaseApiResponse<void>> adminDeleteYogaPose(@Path('code') String code);

  // Admin Yoga Routine Management
  @MultiPart()
  @POST('api/admin/routines')
  Future<BaseApiResponse<YogaRoutine>> adminCreateYogaRoutine(@Body() FormData formData);

  @MultiPart()
  @PUT('api/admin/routines/{id}')
  Future<BaseApiResponse<YogaRoutine>> adminUpdateYogaRoutine(
    @Path('id') String id,
    @Body() FormData formData,
  );

  @DELETE('api/admin/routines/{id}')
  Future<BaseApiResponse<void>> adminDeleteYogaRoutine(@Path('id') String id);
}
