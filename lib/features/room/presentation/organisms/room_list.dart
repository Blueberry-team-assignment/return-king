import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/presentation/atoms/buttons/basic_button.dart';
import 'package:return_king/features/room/presentation/molecules/room_card.dart';
import 'package:return_king/features/room/presentation/pages/room_detail_page.dart';
import 'package:return_king/features/room/domain/providers/room_providers.dart';
import 'package:return_king/features/timeline/domain/providers/timeline_providers.dart';

class RoomList extends ConsumerWidget {
  const RoomList({super.key, required this.roomList});

  final List<Room> roomList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasRooms = ref.watch(roomListProvider);
    return hasRooms.isEmpty
        ? Center(
            child: BasicButton(
                childText: Text('작성', selectionColor: Colors.indigo[500]),
                onPressed: () {
                  ref
                      .read(selectedTimelineListByRoomIdProvider.notifier)
                      .clearSelectedRoom();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RoomDetailPage(isNewRoom: true)));
                }),
          )
        : ListView.builder(
            itemCount: roomList.length,
            itemBuilder: (context, index) {
              final Room item = roomList[index];
              if (item.id == null) {
                return const SizedBox();
              } else {
                return Dismissible(
                  key: Key(item.id!),
                  background: Container(color: Colors.green),
                  secondaryBackground: Container(color: Colors.red),
                  onDismissed: (direction) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.id}를 삭제 했습니다.')),
                    );
                  },
                  child: RoomCard(room: item),
                );
              }
            },
          );
  }
}
