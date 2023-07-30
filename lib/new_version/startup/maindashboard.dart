import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:soilmaster/new_version/startup/newlandingrender.dart';

class Mainmain extends ConsumerWidget {
  const Mainmain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const Mainrender();
          }
          return SignInScreen(
            showAuthActionSwitch: true,
            headerBuilder: (context, snapshot, _) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: AspectRatio(aspectRatio: 3, child: FlutterLogo()),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Welcome to Soil Master Please sign in/up to continue.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            },
            footerBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in/up, you agree to our terms and conditions.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            },
          );
        }));
  }
}
