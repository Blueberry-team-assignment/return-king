import 'package:return_king/features/timeline/domain/repositories/i_timeline_repository.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline/fetch_timeline_query.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline/fetch_timeline_result.dart';
import 'package:return_king/shared/usecases/usecase.dart';

class FetchTimelineUsecase
    implements Usecase<FetchTimelineQuery, FetchTimelineResponse> {
  final ITimelineRepository _repository;

  FetchTimelineUsecase(this._repository);

  @override
  Future<FetchTimelineResponse> execute(
      FetchTimelineQuery command) async {
    var timelineListResult = await _repository.getAllTimelines();
    if (timelineListResult.isError) {
      throw timelineListResult.getError;
    }
    return FetchTimelineResponse(timelineListResult.getValue);
  }
}
