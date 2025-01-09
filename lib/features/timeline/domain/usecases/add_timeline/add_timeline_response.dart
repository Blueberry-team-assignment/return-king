import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:return_king/shared/usecases/response.dart';

class AddTimelineResponse implements Response {
  AddTimelineResponse({required this.timelineDto});
  final TimelineDto timelineDto;
}
