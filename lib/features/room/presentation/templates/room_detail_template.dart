import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/features/timeline/presentation/molecules/input_timeline.dart';
import 'package:return_king/features/timeline/presentation/organisms/slide_list_item.dart';
import 'package:return_king/shared/providers/room/room_providers.dart';
import 'package:return_king/shared/providers/timeline/timeline_providers.dart';

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
        onPopInvokedWithResult: (isPopped, _) {
          if (isPopped) {
            ref.read(selectedRoomProvider.notifier).state = null;
            ref.read(selectedTimelineListByRoomIdProvider.notifier).state = [];
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
            onPressed: () {
              Room room;
              var db = FirebaseFirestore.instance;
              var userId = FirebaseAuth.instance.currentUser?.uid ?? '';
              var now = DateTime.now().toUtc();
              // room 취득
              if (isNewRoom || this.room == null) {
                room = Room(
                    id: db.collection('rooms').doc().id,
                    userId: userId,
                    name: titleController.text,
                    createdAt: now,
                    deleted: false,
                    lastTimelineId: null);

                // 신규 룸 등록
                db.collection('rooms').doc(room.id).set(room.toJson());
                ref.read(selectedRoomProvider.notifier).state = room;
              } else {
                room = this.room!;
              }
              // message 등록

              Timeline timeline = Timeline(
                  id: db.collection('timelines').doc().id,
                  roomId: room.id ?? '',
                  userId: userId,
                  senderType: SenderType.receiver,
                  content: messageController.text,
                  createdAt: now,
                  deleted: false);
              db
                  .collection('timelines')
                  .doc(timeline.id)
                  .set(timeline.toJson());
              db
                  .collection('rooms')
                  .doc(room.id)
                  .update({"lastTimelineId": timeline.id});

              messageController.text = '';
            },
          ),
        ));
  }
}
