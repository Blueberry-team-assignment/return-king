import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/domain/repositories/i_room_repository.dart';
import 'package:return_king/features/room/domain/usecases/fetch_all_room/fetch_all_room_query.dart';
import 'package:return_king/features/room/domain/usecases/fetch_all_room/fetch_all_room_response.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/features/timeline/domain/repositories/i_timeline_repository.dart';
import 'package:return_king/shared/result.dart';
import 'package:return_king/shared/usecases/usecase.dart';

class FetchAllRoomUsecase
    implements Usecase<FetchAllRoomQuery, FetchAllRoomResponse> {
  FetchAllRoomUsecase(this._repository, this._timelineRepository);

  final IRoomRepository _repository;
  final ITimelineRepository _timelineRepository;

  @override
  Future<FetchAllRoomResponse> execute(FetchAllRoomQuery query) async {
    List<Room> rooms = [];

    /// 유저가 가지고 있는 전체 룸을 취득.
    Result<List<Room>> roomListResult = await _repository.getAllRoomList();
    if (roomListResult.isError) {
      // error핸들링
      throw roomListResult.getError;
    }

    /// 유저가 가지고 있는 전체 타임라인을 취득.
    Result<List<Timeline>> timelineListResult =
        await _timelineRepository.getAllTimelines();

    if (timelineListResult.isError) {
      // error핸들링
      throw timelineListResult.getError;
    }

    List<Room> allRoomList = roomListResult.value!;
    List<Timeline> allTimelineList = timelineListResult.value!;

    /// Room정보에 최신 Timeline정보를 추가
    /// => Room리스트에서는 Timeline정보를 표시할 필요가 있음
    for (var roomData in allRoomList) {
      if (roomData.lastTimelineId != null) {
        var lastTimeline = allTimelineList.where((x) => x.id == roomData.lastTimelineId).first;
        var room = roomData.copyWith(lastTimeline: lastTimeline);
        rooms.add(room);
      } else {
        rooms.add(roomData);
      }
    }
    return FetchAllRoomResponse(rooms);
  }
}
