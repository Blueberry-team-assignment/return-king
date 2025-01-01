import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/home/presentation/pages/home_page.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              showAuthActionSwitch: false,
              providers: [
                GoogleProvider(clientId: dotenv.env['GOOGLE_CLIENT_ID']!)
              ],
              headerBuilder: (context, constraints, shrinkOffset) {
                return const Padding(
                  padding: EdgeInsets.all(20),
                  child: AspectRatio(aspectRatio: 1, child: Text('답례왕')),
                );
              },
              footerBuilder: (context, action) {
                return const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    '로그인 하시는 것은 이용약관에 동의 하는 것으로 간주 됩니다.',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
            );
          }
          return const HomePage();
        });
  }
}
