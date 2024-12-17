import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/features/timeline/providers/timeline_notifier.dart';

class RoomListNotifier extends StateNotifier<List<Room>> {
  RoomListNotifier(this.timelineNotifier) : super([]) {
    fetchRooms();
  }
  final TimelineNotifier timelineNotifier;

  Future<void> fetchRooms() async {
    List<Timeline> timelines = await timelineNotifier.getTimeLine();
    timelines.sort((a, b) => a.createdAt.millisecondsSinceEpoch.compareTo(b.createdAt.millisecondsSinceEpoch));
    List<Room> rooms = [
      Room(
        id: 'room1',
        name: 'Family',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        deleted: false,
        lastTimelineId: 'timeline1',
        lastTimeline: timelines.where((timeline) => timeline.roomId == 'room1').first
      ),
      Room(
        id: 'room2',
        name: 'Friends',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        deleted: false,
        lastTimelineId: 'timeline3',
        lastTimeline: timelines.where((timeline) => timeline.roomId == 'room2').first
      ),
    ];
    state = rooms;
  }

  void clearRooms() {
    state = [];
  }
}
