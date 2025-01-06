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
  final int bottomSheetHeight = 60;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController messageController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    ScrollController scrollController = ScrollController();
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    return PopScope(
        onPopInvokedWithResult: (isPopped, _) {
          // 뒤로가기 때 불리는 처리
          if (isPopped) {
            ref
                .read(selectedRoomProvider.notifier)
                .clearSelectedRoom(); // 선택된 room정보를 초기화
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
              : Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom +
                          bottomSheetHeight), // 입력바가 타임라인을 가리는 것 문제에 대한 해결방안
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: timelineList.length,
                    itemBuilder: (context, index) {
                      return SlideListItem(
                          room: room, timeline: timelineList[index]);
                    },
                  ),
                ),
          bottomSheet: InputTimeline(
            controller: messageController,
            onPressed: () async {
              Room room;
              DateTime now = DateTime.now().toUtc();
              if (!context.mounted) {
                return;
              }
              // room 취득
              if (isNewRoom || this.room == null) {
                // 신규 룸 등록
                Result<Room> addRoomResult = await ref
                    .read(selectedRoomProvider.notifier)
                    .addRoom(title: titleController.text, createdAt: now);

                if (addRoomResult.isError) {
                  scaffoldMessenger.showSnackBar(
                    const SnackBar(content: Text('룸 추가 실패.')),
                  );
                  return;
                }
                room = addRoomResult.getValue;
              } else {
                room = this.room!;
              }
              // message 등록
              Result<Timeline> timelineResult = await ref
                  .read(timelineListProvider.notifier)
                  .addTimeline(
                      roomId: room.id ?? '',
                      senderType: SenderType.receiver,
                      content: messageController.text,
                      createdAt: now);
              if (timelineResult.isError) {
                scaffoldMessenger.showSnackBar(
                  const SnackBar(content: Text('타임라인  추가 실패.')),
                );
                return;
              }

              scaffoldMessenger.showSnackBar(
                const SnackBar(content: Text('타임라인 추가 성공.')),
              );

              /// 최신 타임라인 정보를 룸에 등록
              ref
                  .read(selectedRoomProvider.notifier)
                  .updatedLastTimelineId(timelineResult.getValue.id!);

              /// 룸 별 타임라인 다시 불러오기
              ref
                  .read(selectedTimelineListByRoomIdProvider.notifier)
                  .fetchTimelineByRoomId(room.id!);

              messageController.text = '';

              // 스크롤을 가장 아래로 이동
              Future.delayed(const Duration(milliseconds: 100), () {
                /// Delay를 추가하는 이유:
                /// 위젯 트리와 상태 업데이트가 비동기적으로 이루어짐
                /// 새로운 아이템이 리스트에 추가되거나 UI가 갱신되는 경우 레이아웃이 
                /// 완전히 갱신되지 않은 상태에서 스크롤이 조작이 이루어질 수 있음
                /// (Flutter의 프레임 빌드 주기)
                if (scrollController.hasClients) {
                  /// scrollController가 연결된 ListView 같은 스크롤 가능한 위젯을 가자고 있는지 확인
                  scrollController.animateTo(
                      scrollController
                          .position.maxScrollExtent, /// 스크롤 가능한 최대 범위의 최대 위치
                      duration:
                          const Duration(milliseconds: 300), /// 애니메이션 지속시간 0.3초
                      curve: Curves.easeOut); /// 스크롤이 끝날 때 까지 감속하며 자연스럽게 멈추는 효과
                }
              });
            },
          ),
        ));
  }
}
