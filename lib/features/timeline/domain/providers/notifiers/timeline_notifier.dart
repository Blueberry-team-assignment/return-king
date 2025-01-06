import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_query.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_response.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_usecase.dart';
import 'package:return_king/shared/result.dart';

class TimelineNotifier extends StateNotifier<List<Timeline>> {
  TimelineNotifier(this.fetchTimelineByRoomUsecase) : super([]);

  final FetchTimelineByRoomUsecase fetchTimelineByRoomUsecase;

  Future<Result<List<Timeline>>> fetchTimelineByRoomId(String roomId) async {
    FetchTimelineByRoomResponse res = await fetchTimelineByRoomUsecase
        .execute(FetchTimelineByRoomQuery(roomId: roomId));
    state = res.timelines;
    asc();
    return Result.ok(res.timelines);
  }

  void desc() {
    state.sort((a, b) =>
        b.createdAt.millisecondsSinceEpoch -
        a.createdAt.millisecondsSinceEpoch);
  }

  void asc() {
    state.sort((a, b) =>
        a.createdAt.millisecondsSinceEpoch -
        b.createdAt.millisecondsSinceEpoch);
  }

  void clearSelectedRoom() {
    state = [];
  }
}
