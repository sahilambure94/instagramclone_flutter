import 'package:flutter/foundation.dart' show immutable, VoidCallback;
import 'package:instagramclone_flutter/views/components/rich_text/base_text.dart';

@immutable
class LinkText extends BaseText {
  final VoidCallback onTappped;

  const LinkText({
    required super.text,
    required this.onTappped,
    super.style,
  });
}
