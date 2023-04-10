import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagramclone_flutter/state/comments/notifiers/delete_comment_notifier.dart';
import 'package:instagramclone_flutter/state/image_upload/typedefs/is_loading.dart';

final deleteCommentProvider =
    StateNotifierProvider<DeleteCommentStateNotifier, IsLoading>((_) {
  return DeleteCommentStateNotifier();
});
