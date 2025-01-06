import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/shared/usecases/response.dart';

class AddTimelineResponse implements Response {
  AddTimelineResponse({required this.timeline});
  final Timeline timeline;
}
