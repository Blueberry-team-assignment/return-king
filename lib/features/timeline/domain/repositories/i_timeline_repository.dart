import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/shared/result.dart';

abstract class ITimelineRepository {
  Future<Result<List<Timeline>>> getAllTimelines();
  Future<Result<List<Timeline>>> getTimelinesByRoomId(String roomId);
  Future<Result<Timeline>> saveTimeline(Timeline timeline);
}
