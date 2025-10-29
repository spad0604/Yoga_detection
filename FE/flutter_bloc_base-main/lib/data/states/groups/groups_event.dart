import 'package:freezed_annotation/freezed_annotation.dart';

part 'groups_event.freezed.dart';

@freezed
class GroupsEvent with _$GroupsEvent {
  const factory GroupsEvent.loadMyGroups() = GroupsLoadMyGroups;
  const factory GroupsEvent.loadPublicGroups() = GroupsLoadPublicGroups;
  const factory GroupsEvent.refreshMyGroups() = GroupsRefreshMyGroups;
  const factory GroupsEvent.refreshPublicGroups() = GroupsRefreshPublicGroups;
  const factory GroupsEvent.searchGroups(String keyword) = GroupsSearchGroups;
  const factory GroupsEvent.createGroup({
    required String name,
    String? description,
    String? imageUrl,
    @Default(false) bool isPrivate,
  }) = GroupsCreateGroup;
  const factory GroupsEvent.joinGroup(String groupId) = GroupsJoinGroup;
  const factory GroupsEvent.leaveGroup(String groupId) = GroupsLeaveGroup;
}

