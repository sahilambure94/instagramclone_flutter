import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagramclone_flutter/state/auth/models/auth_result.dart';
import 'package:instagramclone_flutter/state/auth/providers/auth_state_provider.dart';
import 'package:instagramclone_flutter/state/providers/is_loading_provider.dart';
import 'package:instagramclone_flutter/views/components/loading/loading_screen.dart';
import 'package:instagramclone_flutter/views/login/login_view.dart';
import 'package:instagramclone_flutter/views/main/main_view.dart';
import 'firebase_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark().copyWith(indicatorColor: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: Consumer(
        builder: (context, ref, child) {
          // display loading screen

          ref.listen<bool>(
            isLoadingProvider,
            (_, isLoading) {
              if (isLoading) {
                LoadingScreen.instance().show(
                  context: context,
                );
              } else {
                LoadingScreen.instance().hide();
              }
            },
          );

          final isLoggedIn =
              ref.watch(authStateProvider).result == AuthResult.success;
          if (isLoggedIn) {
            return const MainView();
          } else {
            return const LoginView();
          }
        },
      ),
    );
  }
}
