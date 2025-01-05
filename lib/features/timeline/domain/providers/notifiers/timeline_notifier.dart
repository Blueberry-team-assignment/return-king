import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_query.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_result.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_usecase.dart';
import 'package:return_king/shared/result.dart';

class TimelineNotifier extends StateNotifier<List<Timeline>> {
  TimelineNotifier(this.fetchTimelineByRoomUsecase) : super([]);

  final FetchTimelineByRoomUsecase fetchTimelineByRoomUsecase;

  Future<Result<List<Timeline>>> fetchTimelineByRoomId(String roomId) async {
    FetchTimelineByRoomResponse res =
        await fetchTimelineByRoomUsecase.execute(FetchTimelineByRoomQuery(roomId: roomId));
    state = res.timelines;
    return Result.ok(res.timelines);
  }

  void clearSelectedRoom() {
    state = [];
  }
}
