import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextLabel extends ConsumerWidget {
  const TextLabel(this.data, {super.key});

  final String data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(data, overflow: TextOverflow.ellipsis);
  }
}
