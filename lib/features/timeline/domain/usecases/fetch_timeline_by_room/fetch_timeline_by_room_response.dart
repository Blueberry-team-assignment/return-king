import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:return_king/shared/usecases/response.dart';

class FetchTimelineByRoomResponse implements Response {
  FetchTimelineByRoomResponse(this.timelineDtoList);
  List<TimelineDto> timelineDtoList;
}
