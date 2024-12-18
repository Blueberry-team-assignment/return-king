import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';

class RoomDetailTemplate extends ConsumerWidget {
  const RoomDetailTemplate({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }),
      ),
      body: Center(child: Text('룸ID : ${room.id}, 룸 이름 : ${room.name}')),
    );
  }
}
