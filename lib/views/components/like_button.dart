import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagramclone_flutter/state/auth/providers/user_id_provider.dart';
import 'package:instagramclone_flutter/state/likes/models/like_dislike_request.dart';
import 'package:instagramclone_flutter/state/likes/providers/has_liked_post_provider.dart';
import 'package:instagramclone_flutter/state/likes/providers/like_dislike_post_provider.dart';
import 'package:instagramclone_flutter/state/posts/typedefs/post_id.dart';
import 'package:instagramclone_flutter/views/components/animations/loading_animation_view.dart';
import 'package:instagramclone_flutter/views/components/animations/small_error_animation_view.dart';

class LikeButton extends ConsumerWidget {
  final PostId postId;
  const LikeButton({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasLiked = ref.watch(
      hasLikedPostProvider(
        postId,
      ),
    );
    return hasLiked.when(
      data: (hasLiked) {
        return IconButton(
          icon: FaIcon(
            hasLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
            color: hasLiked ? Colors.red : Colors.white70,
          ),
          onPressed: () {
            final userId = ref.read(userIdProvider);
            if (userId == null) {
              return;
            } else {
              final likedRequest = LikeDislikeRequest(
                postId: postId,
                likedBy: userId,
              );
              ref.read(
                likeDislikePostProvider(
                  likedRequest,
                ),
              );
            }
          },
        );
      },
      error: (error, stackTrace) {
        return const SmallErrorAnimationView();
      },
      loading: () {
        return const LoadingAnimationView();
      },
    );
  }
}
