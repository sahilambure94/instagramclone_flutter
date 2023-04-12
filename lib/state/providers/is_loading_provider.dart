import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagramclone_flutter/state/auth/providers/auth_state_provider.dart';
import 'package:instagramclone_flutter/state/comments/providers/delete_comment_provider.dart';
import 'package:instagramclone_flutter/state/comments/providers/send_comment_provider.dart';
import 'package:instagramclone_flutter/state/image_upload/providers/image_uploader_provider.dart';
import 'package:instagramclone_flutter/state/posts/providers/delete_post_provider.dart';

final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  final isUploadingImage = ref.watch(imageUploadProvider);
  final isSendingComment = ref.watch(sendCommentProvider);
  final isDeletingComment = ref.watch(deleteCommentProvider);
  final isDeletingPost = ref.watch(deletePostProvider);
  return authState.isLoading ||
      isUploadingImage ||
      isSendingComment ||
      isDeletingComment ||
      isDeletingPost;
});
