import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/presentation/atoms/buttons/plus_button.dart';
import 'package:return_king/features/room/presentation/organisms/room_list.dart';
import 'package:return_king/features/room/presentation/pages/room_detail_page.dart';
import 'package:return_king/features/timeline/domain/providers/timeline_providers.dart';

class RoomListTemplate extends ConsumerWidget {
  const RoomListTemplate({super.key, required this.roomList});
  final List<Room> roomList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PlusButton(onPressed: () {
            ref
              .read(selectedTimelineListByRoomIdProvider.notifier)
              .clearSelectedRoom();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const RoomDetailPage(isNewRoom: true)));
          }),
        ],
      ),
      body: RoomList(roomList: roomList),
    );
  }
}
