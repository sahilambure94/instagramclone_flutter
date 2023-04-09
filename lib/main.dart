import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagramclone_flutter/state/auth/models/auth_result.dart';
import 'package:instagramclone_flutter/state/auth/providers/auth_state_provider.dart';
import 'firebase_options.dart';
import 'dart:developer' as devtools show log;
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

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
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark().copyWith(indicatorColor: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: Consumer(builder: ((context, ref, child) {
        final isLoggedIn =
            ref.watch(authStateProvider).result == AuthResult.success;
        if (isLoggedIn) {
          return const MainView();
        } else {
          return const LoginView();
        }
      })),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return TextButton(
            onPressed: () async {
              ref.read(authStateProvider.notifier).logOut();
            },
            child: const Text('Logout'),
          );
        },
      ),
    );
  }
}

class LoginView extends ConsumerWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
            child: const Text(
              'Sign In With Google',
            ),
          ),
          TextButton(
            onPressed: ref.read(authStateProvider.notifier).loginWithFacebook,
            child: const Text(
              'Sign In With Facebook',
            ),
          ),
        ],
      ),
    );
  }
}
