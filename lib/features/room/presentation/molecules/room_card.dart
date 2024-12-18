import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/presentation/atoms/avatar.dart';
import 'package:return_king/features/room/presentation/pages/room_detail_page.dart';
import 'package:return_king/features/room/providers/room_providers.dart';

class RoomCard extends ConsumerWidget {
  const RoomCard({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        // 선택된 룸을 riverpod 상태에 설정
        ref.read(selectedRoomProvider.notifier).state = room;

        // 상세 페이지로 이동
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RoomDetailPage()));
      },
      child: Card(
        color: Colors.indigo[200], // Card自体の色
        margin: const EdgeInsets.all(2),
        shadowColor: Colors.black, // 影の色
        shape: RoundedRectangleBorder(
          // 枠線を変更できる
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Avatar(),
                Column(
                  children: [
                    Text(
                      room.name,
                    ),
                    Text(
                      room.lastTimeline.content,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
