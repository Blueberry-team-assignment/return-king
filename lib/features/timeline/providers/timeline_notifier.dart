import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';

class TimelineNotifier extends StateNotifier<List<Timeline>> {
  TimelineNotifier() : super([]) {
    fetchTimelines();
  }

  Future<void> fetchTimelines() async {
    state = [
      Timeline(
        id: 'timeline1',
        roomId: 'room1',
        senderType: 'receiver',
        content: 'Received a birthday gift from Mom',
        createdAt: DateTime.now().subtract(const Duration(days: 4)),
        deleted: false,
      ),
      Timeline(
        id: 'timeline2',
        roomId: 'room1',
        senderType: 'sender',
        content: 'Sent a thank you gift to Dad',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        deleted: false,
      ),
      Timeline(
        id: 'timeline3',
        roomId: 'room2',
        senderType: 'sender',
        content: 'Sent flowers to Alex',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        deleted: false,
      ),
      Timeline(
        id: 'timeline4',
        roomId: 'room2',
        senderType: 'receiver',
        content: 'Received a coffee mug from Lisa',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        deleted: false,
      ),
    ];
  }

  Future<List<Timeline>> getTimeLine() async {
    await fetchTimelines();
    return state;
  }

  void clearRooms() {
    state = [];
  }
}
