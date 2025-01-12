import 'package:return_king/features/room/domain/repositories/i_room_repository.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:return_king/features/timeline/domain/repositories/i_timeline_repository.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_query.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_response.dart';
import 'package:return_king/shared/usecases/usecase.dart';

class FetchTimelineByRoomUsecase
    implements Usecase<FetchTimelineByRoomQuery, FetchTimelineByRoomResponse> {
  FetchTimelineByRoomUsecase(this._repository, this._roomRepository);

  final ITimelineRepository _repository;
  final IRoomRepository _roomRepository;

  @override
  Future<FetchTimelineByRoomResponse> execute(
      FetchTimelineByRoomQuery command) async {
    var timelineListResult =
        await _repository.getTimelinesByRoomId(command.roomId);
    if (timelineListResult.isError) {
      throw timelineListResult.getError;
    }

    var roomResult = await _roomRepository.getRoomById(command.roomId);
    if (roomResult.isError) {
      throw roomResult.getError;
    }

    var list = timelineListResult.getValue;

    list.sort((a, b) =>
        a.giftDate.millisecondsSinceEpoch - b.giftDate.millisecondsSinceEpoch);

    var result = list.asMap().entries.map((entry) {
      var i = entry.key;
      var v = entry.value;
      return TimelineDto(v.id!, v.roomId, roomResult.getValue.name, v.content,
          v.senderType, i == 0, i == list.length - 1, v.giftDate, v.createdAt);
    }).toList();

    return FetchTimelineByRoomResponse(result);
  }
}
