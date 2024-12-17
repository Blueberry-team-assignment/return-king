import 'package:flutter_riverpod/flutter_riverpod.dart';

// 탭 상태를 관리하는 StateProvider
final homeTabProvider = StateProvider<int>((ref) => 0);
