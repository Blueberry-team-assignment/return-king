import 'package:return_king/features/timeline/domain/repositories/i_timeline_repository.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_query.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_response.dart';
import 'package:return_king/shared/usecases/usecase.dart';

class FetchTimelineByRoomUsecase
    implements Usecase<FetchTimelineByRoomQuery, FetchTimelineByRoomResponse> {
  FetchTimelineByRoomUsecase(this._repository);

  final ITimelineRepository _repository;

  @override
  Future<FetchTimelineByRoomResponse> execute(
      FetchTimelineByRoomQuery command) async {
    var timelineListResult =
        await _repository.getTimelinesByRoomId(command.roomId);
    if (timelineListResult.isError) {
      throw timelineListResult.getError;
    }
    return FetchTimelineByRoomResponse(timelineListResult.getValue);
  }
}
