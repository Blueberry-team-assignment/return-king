import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/presentation/templates/room_list_template.dart';
import 'package:return_king/shared/providers/room_providers.dart';

class RoomListPage extends ConsumerWidget {
  const RoomListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Room> roomList = ref.watch(roomListProvider);
    return Scaffold(
      body: RoomListTemplate(roomList: roomList),
    );
  }
}
