import 'package:return_king/features/room/domain/repositories/i_room_repository.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/features/timeline/domain/repositories/i_timeline_repository.dart';
import 'package:return_king/features/timeline/domain/usecases/add_timeline/add_timeline_command.dart';
import 'package:return_king/features/timeline/domain/usecases/add_timeline/add_timeline_response.dart';
import 'package:return_king/shared/usecases/usecase.dart';

class AddTimelineUsecase
    implements Usecase<AddTimelineCommand, AddTimelineResponse> {
  AddTimelineUsecase(this._repository, this._roomRepository);

  final ITimelineRepository _repository;
  final IRoomRepository _roomRepository;

  @override
  Future<AddTimelineResponse> execute(AddTimelineCommand command) async {
    var result = await _repository.saveTimeline(Timeline(
        id: null,
        roomId: command.roomId,
        userId: '',
        senderType: command.senderType,
        content: command.content,
        giftDate: command.giftDate,
        createdAt: command.createdAt,
        deleted: false));

    if (result.isError) {
      throw result.getError;
    }
    await _roomRepository.updateTimelineId(
        roomId: result.getValue.roomId, timelineId: result.getValue.id!);

    var roomResult = await _roomRepository.getRoomById(result.getValue.roomId);
    if (roomResult.isError) {
      throw roomResult.getError;
    }
    return AddTimelineResponse(
        timelineDto: TimelineDto(
            result.getValue.id!,
            result.getValue.roomId,
            roomResult.getValue.name,
            result.getValue.content,
            result.getValue.senderType,
            false,
            true,
            result.getValue.giftDate,
            result.getValue.createdAt));
  }
}
