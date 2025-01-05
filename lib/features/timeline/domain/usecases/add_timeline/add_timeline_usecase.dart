import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/features/timeline/domain/repositories/i_timeline_repository.dart';
import 'package:return_king/features/timeline/domain/usecases/add_timeline/add_timeline_command.dart';
import 'package:return_king/features/timeline/domain/usecases/add_timeline/add_timeline_response.dart';
import 'package:return_king/shared/usecases/usecase.dart';

class AddTimelineUsecase
    implements Usecase<AddTimelineCommand, AddTimelineResponse> {
  final ITimelineRepository _repository;

  AddTimelineUsecase(this._repository);

  @override
  Future<AddTimelineResponse> execute(AddTimelineCommand command) async {
    var result = await _repository.saveTimeline(Timeline(
        id: null,
        roomId: command.roomId,
        userId: '',
        senderType: command.senderType,
        content: command.content,
        createdAt: command.createdAt,
        deleted: false));
    if (result.isError) {
      throw result.getError;
    }
    return AddTimelineResponse(
      timeline: result.getValue
    );
  }
}
