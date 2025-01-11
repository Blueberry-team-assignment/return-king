import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:return_king/features/timeline/domain/usecases/add_timeline/add_timeline_command.dart';
import 'package:return_king/features/timeline/domain/usecases/add_timeline/add_timeline_response.dart';
import 'package:return_king/features/timeline/domain/usecases/add_timeline/add_timeline_usecase.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_query.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_response.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_usecase.dart';
import 'package:return_king/shared/result.dart';

class TimelineNotifier extends StateNotifier<List<TimelineDto>> {
  TimelineNotifier(this.fetchTimelineByRoomUsecase, this.addTimelineUsecase)
      : super([]);

  final FetchTimelineByRoomUsecase fetchTimelineByRoomUsecase;
  final AddTimelineUsecase addTimelineUsecase;

  Future<Result<List<TimelineDto>>> fetchTimelineByRoomId(String roomId) async {
    FetchTimelineByRoomResponse res = await fetchTimelineByRoomUsecase
        .execute(FetchTimelineByRoomQuery(roomId: roomId));
    state = res.timelineDtoList;
    asc();
    return Result.ok(res.timelineDtoList);
  }

  Future<Result<TimelineDto>> addTimeline(
      {required String roomId,
      required SenderType senderType,
      required String content,
      required DateTime giftDate,
      required DateTime createdAt}) async {
    AddTimelineResponse addTimelineUsecaseResult =
        await addTimelineUsecase.execute(AddTimelineCommand(
            roomId: roomId,
            senderType: senderType,
            content: content,
            giftDate: giftDate,
            createdAt: createdAt));
    state = [...state, addTimelineUsecaseResult.timelineDto];
    return Result.ok(addTimelineUsecaseResult.timelineDto);
  }

  void desc() {
    state.sort((a, b) =>
        b.giftDate.millisecondsSinceEpoch - a.giftDate.millisecondsSinceEpoch);
  }

  void asc() {
    state.sort((a, b) =>
        a.giftDate.millisecondsSinceEpoch - b.giftDate.millisecondsSinceEpoch);
  }

  void clearSelectedRoom() {
    state = [];
  }
}
