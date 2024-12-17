import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicButton extends ConsumerWidget {
  const BasicButton(
      {super.key,
      this.padding = const EdgeInsets.all(0.0),
      this.margin = const EdgeInsets.all(0.0),
      required this.onPressed,
      required this.childText});

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final VoidCallback onPressed;
  final Text childText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: padding.add(margin),
      child: ElevatedButton(onPressed: onPressed, child: childText),
    );
  }
}
