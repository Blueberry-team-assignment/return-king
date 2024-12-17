import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';

class TimelineNotifier extends StateNotifier<List<Timeline>> {
  TimelineNotifier() : super([]) {
    fetchTimelines();
  }

  Future<void> fetchTimelines() async {
    List<Timeline> timelines = [];
    final random = Random();
    for (int roomIndex = 1; roomIndex <= 30; roomIndex++) {
      for (int timelineIndex = 1; timelineIndex <= 5; timelineIndex++) {
        timelines.add(
          Timeline(
            id: 'timeline${(roomIndex - 1) * 5 + timelineIndex}',
            roomId: 'room$roomIndex',
            senderType: random.nextBool() ? 'sender' : 'receiver',
            content:
                '샘플 데이터 룸: $roomIndex - 타임라인 $timelineIndex',
            createdAt: DateTime.now()
                .subtract(Duration(days: random.nextInt(30))),
            deleted: false,
          ),
        );
      }
    }
    state = timelines;
  }

  Future<List<Timeline>> getTimeLine() async {
    await fetchTimelines();
    return state;
  }

  void clearRooms() {
    state = [];
  }
}
