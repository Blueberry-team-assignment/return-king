import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/features/timeline/presentation/molecules/input_timeline.dart';
import 'package:return_king/features/timeline/presentation/organisms/slide_list_item.dart';
import 'package:return_king/features/room/domain/providers/room_providers.dart';
import 'package:return_king/features/timeline/domain/providers/timeline_providers.dart';
import 'package:return_king/shared/result.dart';

class RoomDetailTemplate extends ConsumerWidget {
  const RoomDetailTemplate({super.key, this.room, required this.timelineList})
      : isNewRoom = room == null;

  final Room? room;
  final List<Timeline> timelineList;
  final bool isNewRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController messageController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    return PopScope(
        onPopInvokedWithResult: (isPopped, _) { // 뒤로가기 때 불리는 처리
          if (isPopped) {
            ref.read(selectedRoomProvider.notifier).clearSelectedRoom();// 선택된 room정보를 초기화
          }
        },
        child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: isNewRoom
                  ? TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: '답례 대상을 입력해주세요',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                      ),
                    )
                  : Text(
                      room?.name ?? '',
                      overflow: TextOverflow.ellipsis,
                    )),
          body: isNewRoom && timelineList.isEmpty
              ? const SizedBox()
              : ListView.builder(
                  itemCount: timelineList.length,
                  itemBuilder: (context, index) {
                    return SlideListItem(
                        room: room, timeline: timelineList[index]);
                  },
                ),
          bottomSheet: InputTimeline(
            controller: messageController,
            onPressed: () async {
              Room room;
              DateTime now = DateTime.now().toUtc();
              // room 취득
              if (isNewRoom || this.room == null) {
                room = Room(
                    id: null,
                    userId: '', // repository에서 설정
                    name: titleController.text,
                    createdAt: now,
                    deleted: false,
                    lastTimelineId: null);

                // 신규 룸 등록
                Result<Room> addRoomResult = await ref
                    .read(selectedRoomProvider.notifier)
                    .addRoom(title: titleController.text, createdAt: now);

                /// TODO
                if (addRoomResult.isError) {
                  /*
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('룸 추가 실패.')),
                  );
                  */
                } else {
                  /*
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('룸 추가 성공.')),
                  );
                  */
                }
                room = addRoomResult.getValue;
              } else {
                room = this.room!;
              }
              // message 등록
              ref.read(timelineListProvider.notifier).addTimeline(
                  roomId: room.id ?? '',
                  senderType: SenderType.receiver,
                  content: messageController.text,
                  createdAt: now);

              messageController.text = '';
            },
          ),
        ));
  }
}
