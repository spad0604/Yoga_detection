import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:flutter_starter/data/entities/response/post_response.dart';
import 'package:flutter_starter/data/entities/response/comment_response.dart';
import 'package:flutter_starter/data/states/activities/activities_bloc.dart';
import 'package:flutter_starter/data/states/activities/activities_event.dart';
import 'package:flutter_starter/di.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_starter/data/repositories/social_posts_repository/social_posts_repository.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:timeago/timeago.dart' as timeago;

@RoutePage()
class ActivitiesPage extends StatefulWidget implements AutoRouteWrapper {
  const ActivitiesPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ActivitiesBloc>(
      create: (ctx) => provider.get<ActivitiesBloc>()
        ..add(const ActivitiesLoadFriendActivities())
        ..add(const ActivitiesLoadMyActivities()),
      child: this,
    );
  }

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class SocialFeedWidget extends StatefulWidget {
  const SocialFeedWidget({Key? key}) : super(key: key);

  @override
  State<SocialFeedWidget> createState() => _SocialFeedWidgetState();
}

class _SocialFeedWidgetState extends State<SocialFeedWidget> {
  List<PostResponse> _posts = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    timeago.setLocaleMessages('vi', timeago.ViMessages());
    _loadFeed();
  }

  Future<void> _loadFeed() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final repo = provider.get<SocialPostsRepository>();
      final feed = await repo.getFeed(page: 0, size: 50);
      setState(() => _posts = feed.items);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());
    if (_error != null) return Center(child: Text('Failed to load posts: $_error'));
    if (_posts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.rss_feed_outlined, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 12),
            Text('No posts yet', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Social posts will appear here',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600])),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadFeed,
      child: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: _posts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) => PostCard(
          post: _posts[index],
          onRefresh: _loadFeed,
        ),
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final PostResponse post;
  final VoidCallback? onRefresh;

  const PostCard({Key? key, required this.post, this.onRefresh}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late bool _isLiked;
  late int _likeCount;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.post.likedByMe;
    _likeCount = widget.post.likeCount;
  }

  List<String> _parseImageUrls() {
    if (widget.post.imageUrls == null) return [];
    try {
      final decoded = jsonDecode(widget.post.imageUrls!);
      if (decoded is List) return decoded.map((e) => e.toString()).toList();
    } catch (_) {}
    return [];
  }

  String _formatTimeAgo(String? createdAt) {
    if (createdAt == null) return 'Just now';
    try {
      final DateTime dateTime = DateTime.parse(createdAt);
      return timeago.format(dateTime, locale: 'en_short');
    } catch (e) {
      return 'Just now';
    }
  }

  Future<void> _toggleLike() async {
    final repo = provider.get<SocialPostsRepository>();
    final wasLiked = _isLiked;
    final oldCount = _likeCount;

    setState(() {
      _isLiked = !_isLiked;
      _likeCount += _isLiked ? 1 : -1;
    });

    try {
      if (_isLiked) {
        await repo.like(postId: widget.post.id);
      } else {
        await repo.unlike(postId: widget.post.id);
      }
      widget.onRefresh?.call();
    } catch (e) {
      setState(() {
        _isLiked = wasLiked;
        _likeCount = oldCount;
      });
    }
  }

  void _showPostDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bottomSheetContext) {
        return _PostDetailSheet(post: widget.post, onRefresh: widget.onRefresh);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = _parseImageUrls();
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPurple.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showPostDetail(context),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Author header
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.primaryPurple.withOpacity(0.2),
                      child: Text(
                        (widget.post.authorName ?? 'A').substring(0, 1).toUpperCase(),
                        style: TextStyle(
                          color: AppColors.primaryPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.post.authorName ?? 'Anonymous',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            _formatTimeAgo(widget.post.createdAt),
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Content
                if (widget.post.content != null && widget.post.content!.isNotEmpty)
                  Text(
                    widget.post.content!,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.textPrimary,
                      height: 1.5,
                    ),
                  ),
                const SizedBox(height: 12),
                // Images
                if (images.isNotEmpty) ...[
                  if (images.length == 1)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          images[0],
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return Container(
                              height: 200,
                              color: AppColors.backgroundLight,
                              child: const Center(child: CircularProgressIndicator()),
                            );
                          },
                          errorBuilder: (context, error, stack) => Container(
                            height: 200,
                            color: AppColors.backgroundLight,
                            child: const Center(child: Icon(Icons.broken_image)),
                          ),
                        ),
                      ),
                    )
                  else
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (context, i) => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            images[i],
                            width: 160,
                            height: 120,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return Container(
                                width: 160,
                                height: 120,
                                color: AppColors.backgroundLight,
                                child: const Center(child: CircularProgressIndicator()),
                              );
                            },
                            errorBuilder: (context, error, stack) => Container(
                              width: 160,
                              height: 120,
                              color: AppColors.backgroundLight,
                              child: const Center(child: Icon(Icons.broken_image)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 12),
                ],
                // Action buttons
                Row(
                  children: [
                    // Like button
                    InkWell(
                      onTap: _toggleLike,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: Row(
                          children: [
                            Icon(
                              _isLiked ? Icons.favorite : Icons.favorite_border,
                              size: 20,
                              color: _isLiked ? Colors.red : AppColors.textSecondary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '$_likeCount',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: _isLiked ? Colors.red : AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Comment button
                    InkWell(
                      onTap: () => _showPostDetail(context),
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: Row(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 20,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${widget.post.commentCount}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Post detail sheet with comments
class _PostDetailSheet extends StatefulWidget {
  final PostResponse post;
  final VoidCallback? onRefresh;

  const _PostDetailSheet({required this.post, this.onRefresh});

  @override
  State<_PostDetailSheet> createState() => _PostDetailSheetState();
}

class _PostDetailSheetState extends State<_PostDetailSheet> {
  final TextEditingController _commentController = TextEditingController();
  List<CommentResponse> _comments = [];
  bool _isLoadingComments = false;

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _loadComments() async {
    setState(() => _isLoadingComments = true);
    try {
      final repo = provider.get<SocialPostsRepository>();
      final result = await repo.getComments(postId: widget.post.id, page: 0, size: 50);
      setState(() => _comments = result.items);
    } catch (e) {
      debugPrint('Failed to load comments: $e');
    } finally {
      setState(() => _isLoadingComments = false);
    }
  }

  Future<void> _postComment() async {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;

    try {
      final repo = provider.get<SocialPostsRepository>();
      await repo.comment(postId: widget.post.id, content: text);
      _commentController.clear();
      await _loadComments();
      widget.onRefresh?.call();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to post comment: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.textSecondary.withOpacity(0.1),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Post Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: AppColors.textSecondary),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              // Post content & comments
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  children: [
                    // Original post (read-only mini card)
                    PostCard(post: widget.post, onRefresh: widget.onRefresh),
                    const SizedBox(height: 16),
                    // Comments section
                    Text(
                      'Comments',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (_isLoadingComments)
                      const Center(child: CircularProgressIndicator())
                    else if (_comments.isEmpty)
                      Text(
                        'No comments yet. Be the first!',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      )
                    else
                      ..._comments.map((comment) => _CommentTile(comment: comment)),
                  ],
                ),
              ),
              // Comment input
              Container(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 12,
                  bottom: 12 + MediaQuery.of(context).viewInsets.bottom,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: AppColors.textSecondary.withOpacity(0.1),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          hintText: 'Write a comment...',
                          hintStyle: TextStyle(color: AppColors.textSecondary.withOpacity(0.5)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: AppColors.textSecondary.withOpacity(0.2)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: AppColors.primaryPurple, width: 2),
                          ),
                          filled: true,
                          fillColor: AppColors.backgroundLight,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: _postComment,
                      icon: Icon(
                        Icons.send,
                        color: AppColors.primaryPurple,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.primaryPurple.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CommentTile extends StatelessWidget {
  final CommentResponse comment;

  const _CommentTile({required this.comment});

  String _formatTimeAgo(String? createdAt) {
    if (createdAt == null) return 'Just now';
    try {
      final DateTime dateTime = DateTime.parse(createdAt);
      return timeago.format(dateTime, locale: 'en_short');
    } catch (e) {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.primaryPurple.withOpacity(0.2),
            child: Text(
              (comment.username ?? 'A').substring(0, 1).toUpperCase(),
              style: TextStyle(
                color: AppColors.primaryPurple,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        comment.username ?? 'Anonymous',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    Text(
                      _formatTimeAgo(comment.createdAt),
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  comment.content ?? '',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Content widget that can be used with pre-provided BLoC
class ActivitiesPageContent extends StatefulWidget {
  const ActivitiesPageContent({super.key});

  @override
  State<ActivitiesPageContent> createState() => _ActivitiesPageContentState();
}

class _ActivitiesPageState extends State<ActivitiesPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Fire a quick social feed request so we can inspect the social posts API
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final socialRepo = provider.get<SocialPostsRepository>();
        final feed = await socialRepo.getFeed(page: 0, size: 50);
        debugPrint('Social feed loaded (${feed.totalElements} items)');
      } catch (e) {
        debugPrint('Failed loading social feed: $e');
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Social Feed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(49),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                labelColor: AppColors.primaryPurple,
                unselectedLabelColor: AppColors.textSecondary,
                indicatorColor: AppColors.primaryPurple,
                tabs: const [
                  Tab(text: 'Friends', icon: Icon(Icons.people)),
                  Tab(text: 'My Activity', icon: Icon(Icons.person)),
                ],
              ),
              Container(
                height: 1,
                color: AppColors.textSecondary.withOpacity(0.1),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFriendActivitiesTab(),
          _buildMyActivitiesTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showCreateSocialPostDialog,
        backgroundColor: AppColors.primaryPurple,
        icon: const Icon(Icons.add),
        label: const Text('New Post'),
      ),
    );
  }

  Future<void> _showCreateSocialPostDialog() async {
    final TextEditingController controller = TextEditingController();
    final socialRepo = provider.get<SocialPostsRepository>();
    final activitiesBloc = context.read<ActivitiesBloc>();

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bottomSheetContext) {
        List<XFile> pickedImages = [];
        return StatefulBuilder(
          builder: (statefulContext, setState) {
            Future<void> pickImages() async {
              try {
                final images = await ImagePicker().pickMultiImage();
                if (images.isNotEmpty) {
                  setState(() => pickedImages.addAll(images));
                }
              } catch (_) {}
            }

            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Create Post',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, color: AppColors.textSecondary),
                          onPressed: () => Navigator.of(bottomSheetContext).pop(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: controller,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: 'Share your thoughts...',
                        hintStyle: TextStyle(color: AppColors.textSecondary.withOpacity(0.5)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: AppColors.textSecondary.withOpacity(0.2)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: AppColors.primaryPurple, width: 2),
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundLight,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: pickImages,
                          icon: const Icon(Icons.photo_library),
                          label: const Text('Add images'),
                        ),
                        const SizedBox(width: 12),
                        if (pickedImages.isNotEmpty)
                          Expanded(
                            child: SizedBox(
                              height: 76,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: pickedImages.length,
                                separatorBuilder: (_, __) => const SizedBox(width: 8),
                                itemBuilder: (ctx, i) {
                                  final img = pickedImages[i];
                                  return Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(File(img.path),
                                            width: 76, height: 76, fit: BoxFit.cover),
                                      ),
                                      Positioned(
                                        top: 2,
                                        right: 2,
                                        child: GestureDetector(
                                          onTap: () => setState(() => pickedImages.removeAt(i)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black45, shape: BoxShape.circle),
                                            padding: const EdgeInsets.all(4),
                                            child: const Icon(Icons.close,
                                                size: 14, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        final text = controller.text.trim();
                        if (text.isEmpty && pickedImages.isEmpty) return;
                        try {
                          await socialRepo.createPost(
                            content: text.isEmpty ? '' : text,
                            imagePaths: pickedImages.map((e) => e.path).toList(),
                          );
                          Navigator.of(bottomSheetContext).pop();
                          // Refresh activities
                          activitiesBloc.add(const ActivitiesLoadMyActivities());
                          activitiesBloc.add(const ActivitiesLoadFriendActivities());
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Posted')));
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Failed to post: $e')));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPurple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.send, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Post',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFriendActivitiesTab() {
    // Temporarily show social posts feed here instead of friend activities
    return const SocialFeedWidget();
  }

  Widget _buildMyActivitiesTab() {
    // Temporarily show social posts feed here instead of my activities
    return const SocialFeedWidget();
  }
}

class _ActivitiesPageContentState extends State<ActivitiesPageContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Fire a quick social feed request so we can inspect the social posts API
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final socialRepo = provider.get<SocialPostsRepository>();
        final feed = await socialRepo.getFeed(page: 0, size: 50);
        debugPrint('Social feed (Content) loaded (${feed.totalElements} items)');
      } catch (e) {
        debugPrint('Failed loading social feed (Content): $e');
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Social Feed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(49),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                labelColor: AppColors.primaryPurple,
                unselectedLabelColor: AppColors.textSecondary,
                indicatorColor: AppColors.primaryPurple,
                tabs: const [
                  Tab(text: 'Friends', icon: Icon(Icons.people)),
                  Tab(text: 'My Activity', icon: Icon(Icons.person)),
                ],
              ),
              Container(
                height: 1,
                color: AppColors.textSecondary.withOpacity(0.1),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFriendActivitiesTab(),
          _buildMyActivitiesTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showCreateSocialPostDialogContent,
        backgroundColor: AppColors.primaryPurple,
        icon: const Icon(Icons.add),
        label: const Text('New Post'),
      ),
    );
  }

  Future<void> _showCreateSocialPostDialogContent() async {
    final TextEditingController controller = TextEditingController();
    final socialRepo = provider.get<SocialPostsRepository>();
    final activitiesBloc = context.read<ActivitiesBloc>();

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bottomSheetContext) {
        List<XFile> pickedImages = [];
        return StatefulBuilder(
          builder: (statefulContext, setState) {
            Future<void> pickImages() async {
              try {
                final images = await ImagePicker().pickMultiImage();
                if (images.isNotEmpty) setState(() => pickedImages.addAll(images));
              } catch (_) {}
            }

            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('New Post', style: Theme.of(context).textTheme.titleMedium),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(bottomSheetContext).pop(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: controller,
                      maxLines: 6,
                      decoration: InputDecoration(hintText: 'Share something...'),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: pickImages,
                          icon: const Icon(Icons.photo_library),
                          label: const Text('Add images'),
                        ),
                        const SizedBox(width: 12),
                        if (pickedImages.isNotEmpty)
                          Expanded(
                            child: SizedBox(
                              height: 76,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: pickedImages.length,
                                separatorBuilder: (_, __) => const SizedBox(width: 8),
                                itemBuilder: (ctx, i) {
                                  final img = pickedImages[i];
                                  return Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(File(img.path),
                                            width: 76, height: 76, fit: BoxFit.cover),
                                      ),
                                      Positioned(
                                        top: 2,
                                        right: 2,
                                        child: GestureDetector(
                                          onTap: () => setState(() => pickedImages.removeAt(i)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black45, shape: BoxShape.circle),
                                            padding: const EdgeInsets.all(4),
                                            child: const Icon(Icons.close,
                                                size: 14, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () async {
                        final text = controller.text.trim();
                        if (text.isEmpty && pickedImages.isEmpty) return;
                        try {
                          await socialRepo.createPost(
                            content: text.isEmpty ? '' : text,
                            imagePaths: pickedImages.map((e) => e.path).toList(),
                          );
                          Navigator.of(bottomSheetContext).pop();
                          activitiesBloc.add(const ActivitiesLoadMyActivities());
                          activitiesBloc.add(const ActivitiesLoadFriendActivities());
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Posted')));
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Failed to post: $e')));
                        }
                      },
                      child: const Text('Post'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFriendActivitiesTab() {
    // Temporarily show social posts feed here instead of friend activities
    return const SocialFeedWidget();
  }

  Widget _buildMyActivitiesTab() {
    // Temporarily show social posts feed here instead of my activities
    return const SocialFeedWidget();
  }
}
