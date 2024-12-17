import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/presentation/atoms/buttons/basic_button.dart';
import 'package:return_king/features/room/providers/room_providers.dart';

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
                onPressed: () => {}),
          )
        : ListView.builder(
            itemCount: roomList.length,
            itemBuilder: (context, index) {
              final item = roomList[index];
              return Dismissible(
                key: Key(item.id),
                background: Container(color: Colors.green),
                secondaryBackground: Container(color: Colors.red),
                onDismissed: (direction) {
                  /*
              setState(() {
                items.removeAt(index);
              });
              */
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$item dismissed')),
                  );
                },
                child: ListTile(title: Text(item.name)),
              );
            },
          );
  }
}
