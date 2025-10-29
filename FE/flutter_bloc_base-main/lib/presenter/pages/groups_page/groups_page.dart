import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/response/yoga_group_response.dart';
import 'package:flutter_starter/data/states/groups/groups_bloc.dart';
import 'package:flutter_starter/data/states/groups/groups_event.dart';
import 'package:flutter_starter/data/states/groups/groups_state.dart';
import 'package:flutter_starter/di.dart';

@RoutePage()
class GroupsPage extends StatefulWidget implements AutoRouteWrapper {
  const GroupsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<GroupsBloc>(
      create: (ctx) => provider.get<GroupsBloc>()
        ..add(const GroupsLoadMyGroups())
        ..add(const GroupsLoadPublicGroups()),
      child: this,
    );
  }

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yoga Groups'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'My Groups', icon: Icon(Icons.group)),
            Tab(text: 'Discover', icon: Icon(Icons.explore)),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search groups...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          context.read<GroupsBloc>().add(const GroupsSearchGroups(''));
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                context.read<GroupsBloc>().add(GroupsSearchGroups(value));
              },
            ),
          ),
          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMyGroupsTab(),
                _buildDiscoverTab(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateGroupDialog(context),
        child: const Icon(Icons.add),
        tooltip: 'Create Group',
      ),
    );
  }

  Widget _buildMyGroupsTab() {
    return BlocBuilder<GroupsBloc, GroupsState>(
      builder: (context, state) {
        if (state.isLoading && state.myGroups.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.myGroups.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.group_outlined, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No groups yet',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Create or join a group to get started!',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<GroupsBloc>().add(const GroupsRefreshMyGroups());
          },
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: state.myGroups.length,
            itemBuilder: (context, index) {
              final group = state.myGroups[index];
              return _GroupCard(group: group, isMyGroup: true);
            },
          ),
        );
      },
    );
  }

  Widget _buildDiscoverTab() {
    return BlocBuilder<GroupsBloc, GroupsState>(
      builder: (context, state) {
        final groupsToShow = state.searchKeyword != null && state.searchKeyword!.isNotEmpty
            ? state.searchResults
            : state.publicGroups;

        if (state.isLoadingPublic && groupsToShow.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (groupsToShow.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.explore_outlined, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  state.searchKeyword != null && state.searchKeyword!.isNotEmpty
                      ? 'No groups found'
                      : 'No public groups',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<GroupsBloc>().add(const GroupsRefreshPublicGroups());
          },
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: groupsToShow.length,
            itemBuilder: (context, index) {
              final group = groupsToShow[index];
              return _GroupCard(group: group, isMyGroup: false);
            },
          ),
        );
      },
    );
  }

  void _showCreateGroupDialog(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    bool isPrivate = false;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Create Group'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Group Name',
                    hintText: 'Enter group name',
                  ),
                  autofocus: true,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description (Optional)',
                    hintText: 'What is this group about?',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('Private Group'),
                  subtitle: const Text('Only invited members can join'),
                  value: isPrivate,
                  onChanged: (value) => setState(() => isPrivate = value),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  context.read<GroupsBloc>().add(
                        GroupsCreateGroup(
                          name: nameController.text.trim(),
                          description: descriptionController.text.trim().isEmpty
                              ? null
                              : descriptionController.text.trim(),
                          isPrivate: isPrivate,
                        ),
                      );
                  Navigator.pop(dialogContext);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Group created successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupCard extends StatelessWidget {
  final YogaGroupResponse group;
  final bool isMyGroup;

  const _GroupCard({
    required this.group,
    required this.isMyGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // Navigate to group details
          // TODO: Implement group details page
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  image: group.imageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(group.imageUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: group.imageUrl == null
                    ? const Icon(Icons.group, size: 40, color: Colors.grey)
                    : null,
              ),
            ),
            // Content
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.people, size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          '${group.memberCount}',
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        if (group.isPrivate) ...[
                          const SizedBox(width: 8),
                          Icon(Icons.lock, size: 12, color: Colors.grey[600]),
                        ],
                      ],
                    ),
                    if (isMyGroup && group.userRole != null) ...[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: group.userRole == 'OWNER'
                              ? Colors.amber
                              : Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          group.userRole!,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            // Action button
            if (!isMyGroup && !group.isMember)
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<GroupsBloc>().add(GroupsJoinGroup(group.id));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Joined group!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    icon: const Icon(Icons.group_add, size: 16),
                    label: const Text('Join'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

