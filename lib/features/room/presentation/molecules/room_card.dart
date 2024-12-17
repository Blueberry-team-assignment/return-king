import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/presentation/atoms/avatar.dart';
import 'package:return_king/features/room/presentation/atoms/labels/text_label.dart';

class RoomCard extends ConsumerWidget {
  const RoomCard({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Colors.green, // Card自体の色
      margin: const EdgeInsets.all(2),
      shadowColor: Colors.black, // 影の色
      shape: RoundedRectangleBorder(
        // 枠線を変更できる
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        children: [
          ListTile(
            leading: Avatar(),
            title: TextLabel('title'),
            subtitle: TextLabel('Card SubTitle'),
          ),
          Text('hello'),
        ],
      ),
    );
  }
}
