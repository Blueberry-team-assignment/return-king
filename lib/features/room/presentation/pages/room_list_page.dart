import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/presentation/templates/room_list_template.dart';
import 'package:return_king/features/room/domain/providers/room_providers.dart';

class RoomListPage extends ConsumerStatefulWidget {
  const RoomListPage({super.key});

  @override
  ConsumerState<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends ConsumerState<RoomListPage> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      ref.read(roomListProvider.notifier).fetchRooms();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Room> roomList = ref.watch(roomListProvider);
    return Scaffold(
      body: RoomListTemplate(roomList: roomList),
    );
  }
}
