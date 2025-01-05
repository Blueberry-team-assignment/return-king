import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/shared/usecases/response.dart';

class FetchAllTimelineResponse implements Response {
  FetchAllTimelineResponse(this.timelines);
  List<Timeline> timelines;
}
