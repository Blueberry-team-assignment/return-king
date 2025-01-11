import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Card(
          color: Colors.white,
          elevation: 4,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 아이콘
                Icon(
                  Icons.wallet_giftcard,
                  size: 40,
                  color: Colors.indigo[300],
                ),
                const SizedBox(width: 16),

                /// 텍스트 정보
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 제목 (룸 이름 또는 "내가 준 선물")
                      Text(
                        room.lastTimeline?.senderType == SenderType.receiver
                            ? room.name
                            : '내가 드린 선물',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 6),

                      /// 마지막 타임라인 내용
                      Text(
                        room.lastTimeline?.content ?? '타임라인이 없습니다.',
                        style: TextStyle(
                          fontSize: 14,
                          color: room.lastTimeline?.content != null
                              ? Colors.black54
                              : Colors.redAccent,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 10),

                      /// 날짜
                      Text(
                        room.lastTimeline?.createdAt != null
                            ? DateFormat('yyyy/MM/dd')
                                .format(room.lastTimeline!.createdAt)
                            : '날짜 없음',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}