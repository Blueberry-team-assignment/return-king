import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/domain/repositories/i_room_repository.dart';
import 'package:return_king/features/room/domain/usecases/add_room/add_room_command.dart';
import 'package:return_king/features/room/domain/usecases/add_room/add_room_response.dart';
import 'package:return_king/shared/usecases/usecase.dart';

class AddRoomUsecase implements Usecase<AddRoomCommand, AddRoomResponse> {
  final IRoomRepository _repository;

  AddRoomUsecase(this._repository);

  @override
  Future<AddRoomResponse> execute(AddRoomCommand command) async {
    Room room = Room(
        id: null,
        userId: '', // repository에서 설정
        name: command.title,
        createdAt: command.createdAt,
        deleted: false,
        lastTimelineId: null);
    var saveRoomResult = await _repository.saveRoom(room);
    if (saveRoomResult.isError) {
      throw saveRoomResult.getError;
    }
    return AddRoomResponse(saveRoomResult.getValue);
  }
}
