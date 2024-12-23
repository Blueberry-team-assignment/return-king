import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/features/timeline/presentation/molecules/input_timeline.dart';
import 'package:return_king/features/timeline/presentation/organisms/slide_list_item.dart';

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
          return SlideListItem(room: room, timeline: timelineList[index]);
        },
      ),
      bottomSheet: InputTimeline(controller: messageController),
    );
  }
}
