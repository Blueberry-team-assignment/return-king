import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/shared/providers/timeline_list_notifier.dart';

class RoomListNotifier extends StateNotifier<List<Room>> {
  RoomListNotifier(this.timelineListNotifier) : super([]) {
    fetchRooms();
  }
  final TimelineListNotifier timelineListNotifier;

  Future<void> fetchRooms() async {
    List<Timeline> timelines = await timelineListNotifier.getTimeLine();
    timelines.sort((a, b) => a.createdAt.millisecondsSinceEpoch
        .compareTo(b.createdAt.millisecondsSinceEpoch));
    List<Room> rooms = List.generate(30, (index) {
      final Timeline timeline = timelines
          .where((timeline) => timeline.roomId == 'room${index + 1}')
          .first;
      return Room(
        id: 'room${index + 1}',
        name: 'Room ${index + 1}',
        createdAt: DateTime.now().subtract(Duration(days: 30 - index)),
        deleted: false,
        lastTimelineId: timeline.id,
        lastTimeline: timeline,
      );
    });
    state = rooms;
  }

  void clearRooms() {
    state = [];
  }
}
