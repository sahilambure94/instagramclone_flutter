import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagramclone_flutter/state/auth/providers/auth_state_provider.dart';
import 'package:instagramclone_flutter/state/image_upload/providers/image_uploader_provider.dart';

final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  final isUploadingImage = ref.watch(imageUploadProvider);
  return authState.isLoading || isUploadingImage;
});
