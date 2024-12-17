import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RkRoom extends ConsumerWidget {
  const RkRoom({
    super.key,
    required this.color,
    required this.title,
    required this.lastContent,
    required this.lastContentUpdatedAt,
  });

  final String color;
  final String title;
  final String lastContent;
  final BigInt lastContentUpdatedAt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Card(
      child: Row(children: []),
    );
  }
}
