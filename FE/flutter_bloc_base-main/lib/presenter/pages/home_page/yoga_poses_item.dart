part of 'home_page.dart';

class YogaPosesItem extends StatefulWidget {
  final YogaPoseDetails item;
  final bool isAdmin;
  
  const YogaPosesItem({
    super.key, 
    required this.item,
    this.isAdmin = false,
  });

  @override
  State<YogaPosesItem> createState() => _YogaPosesItemState();
}

class _YogaPosesItemState extends State<YogaPosesItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) {
            setState(() => _isPressed = false);
            context.router.push(PoseDetailsRoute(item: widget.item));
          },
          onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: Matrix4.identity()..scale(_isPressed ? 0.98 : 1.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              AppColors.primaryPurpleLight.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isPressed ? AppColors.primaryPurple.withOpacity(0.3) : AppColors.border,
            width: 1.5,
          ),
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: AppColors.primaryPurple.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Image container
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: AppColors.gradientPurple,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryPurple.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.item.imageUrl ??
                      'https://static.wikia.nocookie.net/wiki-shincau-be-but-chi/images/8/8b/8264.jpg/revision/latest?cb=20160521113814&path-prefix=vi',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.primaryPurpleLight.withOpacity(0.3),
                    child: Icon(
                      Icons.self_improvement_outlined,
                      color: AppColors.primaryPurple,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.item.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Info chips
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryPurpleLight.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              size: 14,
                              color: AppColors.primaryPurple,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.item.totalMinutes?.toString() ?? '0'} min',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.primaryPurple,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryTealLight.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.item.level ?? 'Beginner',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.secondaryTeal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Arrow icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryPurpleLight.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: AppColors.primaryPurple,
              ),
            ),
          ],
        ),
      ),
    ),
        // Admin buttons
        if (widget.isAdmin)
          Positioned(
            top: 8,
            right: 8,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Delete button
                InkWell(
                  onTap: () async {
                    final result = await AdminPoseDeleteDialog.show(
                      context,
                      widget.item.id,
                      widget.item.name,
                    );
                    if (result == true) {
                      // Refresh parent list
                      context.read<HomePageBloc>().add(HomePageStarted());
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.delete_outline,
                      size: 18,
                      color: Colors.red[400],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Edit button
                InkWell(
                  onTap: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AdminAddEditPosePage(
                          poseId: widget.item.id,
                          initialName: widget.item.name,
                          initialMinutes: widget.item.totalMinutes,
                          initialCalories: widget.item.totalCalories,
                          initialLevel: widget.item.level,
                          initialDescription: widget.item.description,
                          initialImageUrl: widget.item.imageUrl,
                        ),
                      ),
                    );
                    if (result == true) {
                      // Refresh parent list
                      context.read<HomePageBloc>().add(HomePageStarted());
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 18,
                      color: AppColors.primaryPurple,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
