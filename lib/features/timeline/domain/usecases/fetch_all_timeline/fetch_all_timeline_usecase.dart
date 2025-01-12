import 'package:return_king/features/room/domain/repositories/i_room_repository.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:return_king/features/timeline/domain/repositories/i_timeline_repository.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_all_timeline/fetch_all_timeline_query.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_all_timeline/fetch_all_timeline_response.dart';
import 'package:return_king/shared/usecases/usecase.dart';

class FetchAllTimelineUsecase
    implements Usecase<FetchAllTimelineQuery, FetchAllTimelineResponse> {
  FetchAllTimelineUsecase(this._repository, this._roomRepository);

  final ITimelineRepository _repository;
  final IRoomRepository _roomRepository;

  @override
  Future<FetchAllTimelineResponse> execute(
      FetchAllTimelineQuery command) async {
    var timelineListResult = await _repository.getAllTimelines();
    if (timelineListResult.isError) {
      throw timelineListResult.getError;
    }

    var roomListResult = await _roomRepository.getAllRoomList();
    if (roomListResult.isError) {
      throw roomListResult.getError;
    }

    var timelineList = timelineListResult.getValue;

    timelineList.sort((a, b) =>
        a.giftDate.millisecondsSinceEpoch - b.giftDate.millisecondsSinceEpoch);


    var result = timelineList.asMap().entries.map((entry) {
      final i = entry.key;
      final x = entry.value;
      return TimelineDto(
          x.id!,
          x.roomId,
          roomListResult.value?.firstWhere((r) => r.id == x.roomId).name ?? '',
          x.content,
          x.senderType,
          i == 0,
          i == timelineList.length - 1,
          x.giftDate,
          x.createdAt);
    }).toList();

    return FetchAllTimelineResponse(result);
  }
}
