import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlusButton extends ConsumerWidget {
  const PlusButton({
    super.key,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    required this.onPressed,
  });

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: padding.add(margin),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.add,
          color: Colors.indigo[500],
        ),
      ),
    );
  }
}
