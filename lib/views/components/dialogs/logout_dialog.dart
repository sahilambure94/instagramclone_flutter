import 'package:flutter/foundation.dart' show immutable;
import 'package:instagramclone_flutter/views/components/constants/strings.dart';
import 'package:instagramclone_flutter/views/components/dialogs/alert_dialog_model.dart';

@immutable
class LogoutDialog extends AlertDialogModel<bool> {
  const LogoutDialog()
      : super(
          title: Strings.logOut,
          message: 'Are you sure you want to logout?',
          buttons: const {
            Strings.cancel: false,
            Strings.logOut: true,
          },
        );
}
