import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/login/presentation/organisms/auth_gate.dart';
import 'package:return_king/firebase_options.dart';

Future<void> main() async {
  /// region 초기 설정

  /// dotenv설정
  await dotenv.load(fileName: ".env");

  /// Firebase설정
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  ///endregion
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue), home: const AuthGate());
  }
}
