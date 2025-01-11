import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:return_king/features/timeline/presentation/molecules/input_timeline.dart';
import 'package:return_king/features/timeline/presentation/organisms/slide_list_item.dart';
import 'package:return_king/features/room/domain/providers/room_providers.dart';
import 'package:return_king/features/timeline/domain/providers/timeline_providers.dart';
import 'package:return_king/shared/result.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RoomDetailTemplate extends ConsumerWidget {
  const RoomDetailTemplate(
      {super.key, this.room, required this.timelineDtoList})
      : isNewRoom = room == null;

  final Room? room;
  final List<TimelineDto> timelineDtoList;
  final bool isNewRoom;
  final int bottomSheetHeight = 60;

  String? getShortName(String? text) {
    if (text == null || text.length <= 3) {
      return text;
    } else {
      return '${text.characters.take(2)}..';
    }
  }

  void saveTimeline(
      context,
      titleController,
      messageController,
      scrollController,
      scaffoldMessenger,
      WidgetRef ref,
      SenderType selectedSenderType) async {
    Room room;
    DateTime now = DateTime.now().toUtc();
    if (!context.mounted) {
      return;
    }
    // room 취득
    if (isNewRoom || this.room == null) {
      if (titleController.text.isEmpty) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('상단의 룸 답례대상을 입력해주세요')),
        );
        return;
      }
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
    if (messageController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('타임라인 메세지를 입력해주세요')),
      );
      return;
    }
    // timelineId를 room에 등록
    Result<TimelineDto> timelineResult = await ref
        .read(selectedTimelineListByRoomIdProvider.notifier)
        .addTimeline(
            roomId: room.id ?? '',
            senderType: selectedSenderType,
            content: messageController.text,
            giftDate: ref.read(selectedGiftDateProvider),
            createdAt: now);
    if (timelineResult.isError) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('타임라인  추가 실패.')),
      );
      return;
    }

    /// 룸 별 타임라인 다시 불러오기
    await ref
        .read(selectedTimelineListByRoomIdProvider.notifier)
        .fetchTimelineByRoomId(room.id!);

    await ref.read(roomListProvider.notifier).fetchRooms();

    scaffoldMessenger.showSnackBar(
      const SnackBar(content: Text('타임라인 추가 성공.')),
    );

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
        scrollController.animateTo(scrollController.position.maxScrollExtent,

            /// 스크롤 가능한 최대 범위의 최대 위치
            duration: const Duration(milliseconds: 300),

            /// 애니메이션 지속시간 0.3초
            curve: Curves.easeOut);

        /// 스크롤이 끝날 때 까지 감속하며 자연스럽게 멈추는 효과
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController messageController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    ScrollController scrollController = ScrollController();
    SenderType selectedSenderType = SenderType.sender;

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    return PopScope(
        onPopInvokedWithResult: (isPopped, _) {
          // 뒤로가기 때 불리는 처리
          if (isPopped) {
            // delay를 안주면 이동하는 동안 설정 값이 null로 표시가 되는 문제가 있음
            Future.delayed(const Duration(milliseconds: 100), () {
              ref
                  .read(selectedRoomProvider.notifier)
                  .clearSelectedRoom(); // 선택된 room정보를 초기화
            });
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true, // 키보드가 올라오면 body를 리사이즈 해줌
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
          body: Column(
            children: [
              isNewRoom && timelineDtoList.isEmpty
                  ? const Expanded(child: SizedBox())
                  : Expanded(
                      child: ListView.builder(
                      controller: scrollController,
                      itemCount: timelineDtoList.length,
                      itemBuilder: (context, index) {
                        return SlideListItem(
                            room: room, timelineDto: timelineDtoList[index]);
                      },
                    )),
              Column(
                children: [
                  Row(children: [
                    ElevatedButton(
                      onPressed: () async {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Consumer(
                              builder: (context, ref, child) {
                                return Column(children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 48),
                                    child: TextButton(
                                      onPressed: () {
                                        ref
                                            .read(selectedGiftDateProvider
                                                .notifier)
                                            .state = DateTime.now();
                                      },
                                      child: const Text(
                                        "오늘",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 250,
                                    child: ScrollDatePicker(
                                      selectedDate:
                                          ref.watch(selectedGiftDateProvider),
                                      locale: const Locale('ko'),
                                      scrollViewOptions:
                                          const DatePickerScrollViewOptions(
                                              year: ScrollViewDetailOptions(
                                                label: '년',
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                              ),
                                              month: ScrollViewDetailOptions(
                                                label: '월',
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                              ),
                                              day: ScrollViewDetailOptions(
                                                label: '일',
                                              )),
                                      onDateTimeChanged: (DateTime value) {
                                        ref
                                            .read(selectedGiftDateProvider
                                                .notifier)
                                            .state = value;
                                      },
                                    ),
                                  )
                                ]);
                              },
                            );
                          },
                        );
                      },
                      child: Text(DateFormat('yy/MM/dd')
                                  .format(DateTime.now()) ==
                              DateFormat('yy/MM/dd')
                                  .format(ref.watch(selectedGiftDateProvider))
                          ? '오늘'
                          : DateFormat('yy/MM/dd')
                              .format(ref.watch(selectedGiftDateProvider))),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: ToggleSwitch(
                        initialLabelIndex: 0,
                        minWidth: double.infinity,
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const [
                          '내가 드린 선물',
                          '받은 선물'
                        ],
                        activeBgColors: const [
                          [Colors.blue],
                          [Colors.deepOrange]
                        ],
                        onToggle: (index) {
                          selectedSenderType = SenderType.values[index!];
                        },
                      ),
                    ),
                  ]),
                  InputTimeline(
                    controller: messageController,
                    onPressed: () => saveTimeline(
                        context,
                        titleController,
                        messageController,
                        scrollController,
                        scaffoldMessenger,
                        ref,
                        selectedSenderType),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
