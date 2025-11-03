import 'dart:io';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/data/states/social_feed/social_feed_bloc.dart';
import 'package:flutter_starter/data/states/social_feed/social_feed_event.dart';
import 'package:flutter_starter/data/states/social_feed/social_feed_state.dart';
import 'package:flutter_starter/data/entities/response/post_response.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';

@RoutePage()
class SocialFeedPage extends StatefulWidget implements AutoRouteWrapper {
  const SocialFeedPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SocialFeedBloc>(
      create: (ctx) => provider.get<SocialFeedBloc>()..add(const SocialFeedEvent.fetchFeed()),
      child: this,
    );
  }

  @override
  State<SocialFeedPage> createState() => _SocialFeedPageState();
}

class _SocialFeedPageState extends State<SocialFeedPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    timeago.setLocaleMessages('vi', timeago.ViMessages());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _showCreatePostDialog() async {
    final TextEditingController controller = TextEditingController();
    final bloc = context.read<SocialFeedBloc>();
    String visibility = 'PUBLIC';
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bottomSheetContext) {
        List<XFile> pickedImages = [];
        return StatefulBuilder(
          builder: (statefulContext, setState) {
            Future<void> pickImages() async {
              final List<XFile>? images = await ImagePicker().pickMultiImage();
              if (images != null && images.isNotEmpty) {
                setState(() => pickedImages.addAll(images));
              }
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
                        Text(LocaleKeys.CreatePost.tr(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary)),
                        IconButton(
                            icon: Icon(Icons.close, color: AppColors.textSecondary),
                            onPressed: () => Navigator.of(bottomSheetContext).pop()),
                      ],
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: visibility,
                      decoration: InputDecoration(labelText: LocaleKeys.Visibility.tr()),
                      items: [
                        DropdownMenuItem(value: 'PUBLIC', child: Text(LocaleKeys.Public.tr())),
                        DropdownMenuItem(value: 'FRIENDS', child: Text(LocaleKeys.Friends.tr())),
                      ],
                      onChanged: (v) => setState(() => visibility = v ?? 'PUBLIC'),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: controller,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: LocaleKeys.ShareWithEveryone.tr(),
                        hintStyle: TextStyle(color: AppColors.textSecondary.withOpacity(0.5)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: AppColors.textSecondary.withOpacity(0.2))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: AppColors.primaryPurple, width: 2)),
                        filled: true,
                        fillColor: AppColors.backgroundLight,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(children: [
                      ElevatedButton.icon(
                        onPressed: pickImages,
                        icon: const Icon(Icons.photo_library),
                        label: Text(LocaleKeys.AddImages.tr()),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryPurple,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
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
                                return Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(File(img.path),
                                        width: 76, height: 76, fit: BoxFit.cover),
                                  ),
                                  Positioned(
                                    top: 2,
                                    right: 2,
                                    child: GestureDetector(
                                      onTap: () => setState(() => pickedImages.removeAt(i)),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.black45, shape: BoxShape.circle),
                                        padding: const EdgeInsets.all(4),
                                        child:
                                            const Icon(Icons.close, size: 14, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]);
                              },
                            ),
                          ),
                        ),
                    ]),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        final text = controller.text.trim();
                        if (text.isNotEmpty || pickedImages.isNotEmpty) {
                          bloc.add(SocialFeedEvent.createPost(
                              content: text.isEmpty ? '' : text,
                              imagePaths: pickedImages.map((e) => e.path).toList(),
                              visibility: visibility));
                          Navigator.of(bottomSheetContext).pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryPurple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          elevation: 2),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        const Icon(Icons.send, size: 20),
                        const SizedBox(width: 8),
                        Text(LocaleKeys.Post.tr(),
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))
                      ]),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(LocaleKeys.SocialFeed.tr()),
      ),
      body: BlocBuilder<SocialFeedBloc, SocialFeedState>(builder: (context, state) {
        return state.when(
          initial: () => _buildEmptyState(),
          loading: () => Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryPurple))),
          loaded: (feed) => feed.isEmpty
              ? _buildEmptyState()
              : RefreshIndicator(
                  onRefresh: () async =>
                      context.read<SocialFeedBloc>().add(const SocialFeedEvent.fetchFeed()),
                  color: AppColors.primaryPurple,
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: feed.length,
                    itemBuilder: (ctx, idx) => _buildPostCard(context, feed[idx]),
                  ),
                ),
          error: (msg) => _buildErrorState(msg),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showCreatePostDialog,
        backgroundColor: AppColors.primaryPurple,
        icon: const Icon(Icons.add),
        label: Text(LocaleKeys.NewPost.tr()),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: AppColors.gradientPurple.map((c) => c.withOpacity(0.1)).toList()),
              shape: BoxShape.circle),
          child: Icon(Icons.public, size: 80, color: AppColors.primaryPurple.withOpacity(0.5)),
        ),
        const SizedBox(height: 24),
        Text(LocaleKeys.NoPostsYet.tr(),
            style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
        const SizedBox(height: 8),
        Text(LocaleKeys.ShareSomething.tr(),
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary)),
        const SizedBox(height: 24),
        ElevatedButton.icon(
            onPressed: _showCreatePostDialog,
            icon: const Icon(Icons.add),
            label: Text(LocaleKeys.CreatePost.tr()),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)))),
      ]),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.error_outline, size: 64, color: Colors.red.withOpacity(0.5)),
        const SizedBox(height: 16),
        Text(LocaleKeys.FailedToLoadFeed.tr(),
            style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
        const SizedBox(height: 8),
        Text(message,
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            textAlign: TextAlign.center),
        const SizedBox(height: 24),
        ElevatedButton.icon(
            onPressed: () => context.read<SocialFeedBloc>().add(const SocialFeedEvent.fetchFeed()),
            icon: const Icon(Icons.refresh),
            label: Text(LocaleKeys.Retry.tr()),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)))),
      ]),
    );
  }

  Widget _buildPostCard(BuildContext context, PostResponse post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: AppColors.primaryPurple.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4))
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showPostDetail(context, post),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primaryPurple.withOpacity(0.2),
                    child: Text((post.authorName ?? 'A').substring(0, 1).toUpperCase(),
                        style: TextStyle(
                            color: AppColors.primaryPurple, fontWeight: FontWeight.bold))),
                const SizedBox(width: 12),
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(post.authorName ?? 'Anonymous',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  Text(_formatTimeAgo(post.createdAt),
                      style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                ])),
              ]),
              const SizedBox(height: 16),
              if (post.content != null && post.content!.isNotEmpty)
                Text(post.content!,
                    style: TextStyle(fontSize: 15, color: AppColors.textPrimary, height: 1.5)),
              const SizedBox(height: 12),
              ..._buildPostImages(post),
              const SizedBox(height: 12),
              Row(children: [
                InkWell(
                  onTap: () => context.read<SocialFeedBloc>().add(post.likedByMe
                      ? SocialFeedEvent.unlikePost(postId: post.id)
                      : SocialFeedEvent.likePost(postId: post.id)),
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Row(children: [
                      Icon(post.likedByMe ? Icons.favorite : Icons.favorite_border,
                          size: 20, color: post.likedByMe ? Colors.red : AppColors.textSecondary),
                      const SizedBox(width: 6),
                      Text('${post.likeCount}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: post.likedByMe ? Colors.red : AppColors.textSecondary)),
                    ]),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () => _showPostDetail(context, post),
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Row(children: [
                      const Icon(Icons.comment_outlined, size: 20, color: AppColors.textSecondary),
                      const SizedBox(width: 6),
                      Text('${post.commentCount}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary)),
                    ]),
                  ),
                ),
              ]),
            ]),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPostImages(PostResponse post) {
    final List<String> urls = [];
    if (post.imageUrls != null && post.imageUrls!.trim().isNotEmpty) {
      try {
        final decoded = json.decode(post.imageUrls!);
        if (decoded is List) {
          for (final item in decoded) {
            if (item is String && item.trim().isNotEmpty) urls.add(item);
          }
        } else if (decoded is String) {
          urls.add(decoded);
        }
      } catch (_) {
        final raw = post.imageUrls!.trim();
        if (raw.isNotEmpty) urls.add(raw);
      }
    }
    if (urls.isEmpty) return [];
    if (urls.length == 1) {
      return [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(urls[0],
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) => progress == null
                    ? child
                    : Container(
                        height: 200,
                        color: AppColors.backgroundLight,
                        child: const Center(child: CircularProgressIndicator())),
                errorBuilder: (context, error, stack) => Container(
                    height: 200,
                    color: AppColors.backgroundLight,
                    child: const Center(child: Icon(Icons.broken_image)))),
          ),
        ),
      ];
    }
    return [
      SizedBox(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: urls.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, i) => ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(urls[i],
                width: 160,
                height: 120,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) => progress == null
                    ? child
                    : Container(
                        width: 160,
                        height: 120,
                        color: AppColors.backgroundLight,
                        child: const Center(child: CircularProgressIndicator())),
                errorBuilder: (context, error, stack) => Container(
                    width: 160,
                    height: 120,
                    color: AppColors.backgroundLight,
                    child: const Center(child: Icon(Icons.broken_image)))),
          ),
        ),
      ),
    ];
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

  void _showPostDetail(BuildContext context, PostResponse post) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bottomSheetContext) {
        final TextEditingController commentController = TextEditingController();
        return DraggableScrollableSheet(
          initialChildSize: 0.85,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (_, scrollController) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColors.textSecondary.withOpacity(0.1)))),
                  child: Row(children: [
                    Expanded(
                        child: Text(LocaleKeys.PostAndComments.tr(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    IconButton(
                        icon: Icon(Icons.close, color: AppColors.textSecondary),
                        onPressed: () => Navigator.of(bottomSheetContext).pop()),
                  ]),
                ),
                Expanded(
                  child: ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(20),
                      children: [
                        _buildPostCard(context, post),
                        const SizedBox(height: 16),
                        Text(LocaleKeys.Comments.tr(),
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 12),
                        Text(LocaleKeys.NoCommentsYet.tr(), style: TextStyle(fontSize: 14)),
                      ]),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 12,
                      bottom: 12 + MediaQuery.of(bottomSheetContext).viewInsets.bottom),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border(top: BorderSide(color: AppColors.textSecondary.withOpacity(0.1)))),
                  child: Row(children: [
                    Expanded(
                      child: TextField(
                        controller: commentController,
                        textInputAction: TextInputAction.send,
                        decoration: InputDecoration(
                          hintText: LocaleKeys.WriteComment.tr(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide:
                                  BorderSide(color: AppColors.textSecondary.withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: AppColors.primaryPurple, width: 2)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        onSubmitted: (value) {
                          final text = value.trim();
                          if (text.isNotEmpty) {
                            context
                                .read<SocialFeedBloc>()
                                .add(SocialFeedEvent.addComment(postId: post.id, content: text));
                            commentController.clear();
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {
                        final text = commentController.text.trim();
                        if (text.isNotEmpty) {
                          context
                              .read<SocialFeedBloc>()
                              .add(SocialFeedEvent.addComment(postId: post.id, content: text));
                          commentController.clear();
                        }
                      },
                      icon: Icon(Icons.send, color: AppColors.primaryPurple),
                      style: IconButton.styleFrom(
                          backgroundColor: AppColors.primaryPurple.withOpacity(0.1)),
                    ),
                  ]),
                ),
              ]),
            );
          },
        );
      },
    );
  }
}
