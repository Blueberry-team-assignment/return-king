import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/presentation/atoms/buttons/plus_button.dart';
import 'package:return_king/features/room/presentation/organisms/room_list.dart';
import 'package:return_king/features/room/providers/room_providers.dart';

class RoomListTemplate extends ConsumerWidget {
  const RoomListTemplate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Room> roomList = ref.watch(roomListProvider);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PlusButton(onPressed: () => {}),
        ],
      ),
      body: RoomList(roomList: roomList),
    );
  }
}
