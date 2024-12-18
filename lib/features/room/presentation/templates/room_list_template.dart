import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/presentation/atoms/buttons/plus_button.dart';
import 'package:return_king/features/room/presentation/organisms/room_list.dart';

class RoomListTemplate extends ConsumerWidget {
  const RoomListTemplate({super.key, required this.roomList});
  final List<Room> roomList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
