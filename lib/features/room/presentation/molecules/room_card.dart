import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/domain/providers/room_providers.dart';
import 'package:return_king/features/room/presentation/pages/room_detail_page.dart';
import 'package:return_king/features/timeline/domain/providers/timeline_providers.dart';

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
        if (room.id == null) {
          throw Exception('not selected Room');
        }

        /// 데이터 가져오기
        await ref.read(selectedRoomProvider.notifier).fetchRoom(room.id!);
        await ref
            .read(selectedTimelineListByRoomIdProvider.notifier)
            .fetchTimelineByRoomId(room.id!);

        /// 안전하게 context 확인 후 화면 이동
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RoomDetailPage()),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          color: Colors.indigo[50],
          margin: const EdgeInsets.all(2),
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 10.0),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.wallet_giftcard),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              room.lastTimeline?.senderType ==
                                      SenderType.receiver
                                  ? room.name
                                  : '내가 준 선물',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              room.lastTimeline?.content ??
                                  '타임라인이 없습니다.',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        room.lastTimeline?.createdAt != null
                            ? DateFormat('yy/MM/dd')
                                .format(room.lastTimeline!.createdAt)
                            : '날짜 없음',
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}