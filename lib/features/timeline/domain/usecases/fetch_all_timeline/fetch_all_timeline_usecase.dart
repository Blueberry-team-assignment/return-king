import 'package:return_king/features/timeline/domain/repositories/i_timeline_repository.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_all_timeline/fetch_all_timeline_query.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_all_timeline/fetch_all_timeline_response.dart';
import 'package:return_king/shared/usecases/usecase.dart';

class FetchAllTimelineUsecase
    implements Usecase<FetchAllTimelineQuery, FetchAllTimelineResponse> {
  final ITimelineRepository _repository;

  FetchAllTimelineUsecase(this._repository);

  @override
  Future<FetchAllTimelineResponse> execute(
      FetchAllTimelineQuery command) async {
    var timelineListResult = await _repository.getAllTimelines();
    if (timelineListResult.isError) {
      throw timelineListResult.getError;
    }
    return FetchAllTimelineResponse(timelineListResult.getValue);
  }
}
