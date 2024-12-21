import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/presentation/atoms/avatar.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';

class RoomDetailTemplate extends ConsumerWidget {
  const RoomDetailTemplate(
      {super.key, required this.room, required this.timelineList});

  final Room room;
  final List<Timeline> timelineList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController messageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView.builder(
        itemCount: timelineList.length,
        itemBuilder: (context, index) {
          final item = timelineList[index];
          final isRightAlign = SenderType.receiver == item.senderType;
          final mainAlign = isRightAlign
              ? MainAxisAlignment.end
              : MainAxisAlignment.start;
          final crossAlign = isRightAlign
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start;
          final List<Widget> timelineRow = [
            const Avatar(),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: crossAlign,
              children: [
                Text(room.name),
                Column(
                  crossAxisAlignment: crossAlign,
                  children: [
                    Text(item.roomId),
                    Text(item.content),
                    Text(item.createdAt.toIso8601String()),
                  ],
                )
              ],
            )
          ];
          return Dismissible(
            key: Key(item.id),
            background: Container(color: Colors.green),
            secondaryBackground: Container(
              color: Colors.red,
              child: const Expanded(child: Text('받은 선물!')),
            ),
            onDismissed: (direction) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.id}를 삭제 했습니다.')),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              child: Row(
              mainAxisAlignment: mainAlign,
              children: [
                if (SenderType.receiver == item.senderType)
                  ...[...timelineRow].reversed
                else
                  ...timelineRow
              ],
            ),
            ),
          );
        },
      ),
      bottomSheet: ColoredBox(
          color: Colors.indigo.shade400,
          child: SizedBox(
            height: 80,
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: messageController,
                  decoration: const InputDecoration(
                      hintText: '입력해봐 ㅎㅎ', border: InputBorder.none),
                )),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                )
              ],
            ),
          )),
    );
  }
}
