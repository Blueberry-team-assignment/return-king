import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/domain/providers/room_providers.dart';
import 'package:return_king/features/room/presentation/pages/room_detail_page.dart';
import 'package:return_king/features/timeline/domain/providers/timeline_providers.dart';
import 'package:return_king/shared/presentation/atoms/avatar.dart';

class RoomCard extends ConsumerWidget {
  const RoomCard({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {

        /// 상세 페이지로 이동하기 전에 데이터 취득 처리 실행
        // 선택된 룸과 이어지는 타임라인을 취득
        ref.read(selectedRoomProvider.notifier)
          .getRoom();
        // room별 타임라인 취득
        if (room.id != null) {
          ref
              .read(selectedTimelineListByRoomIdProvider.notifier)
              .getTimelineByRoomId(room.id!);
        }
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
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Row(
                  children: [
                    const Avatar(),
                    const SizedBox(width: 12),
                    Column(
                      children: [
                        Text(
                          room.lastTimeline?.createdAt.toString() ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          room.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          room.lastTimeline?.content ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
