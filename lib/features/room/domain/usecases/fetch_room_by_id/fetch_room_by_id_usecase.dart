import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/domain/repositories/i_room_repository.dart';
import 'package:return_king/features/room/domain/usecases/fetch_room_by_id/fetch_room_by_id_response.dart';
import 'package:return_king/features/room/domain/usecases/fetch_room_by_id/fetch_room_by_id_query.dart';
import 'package:return_king/shared/result.dart';
import 'package:return_king/shared/usecases/usecase.dart';

class FetchRoomByIdUsecase
    implements Usecase<FetchRoomByIdQuery, FetchRoomByIdResponse> {
  FetchRoomByIdUsecase(this._repository);

  final IRoomRepository _repository;

  @override
  Future<FetchRoomByIdResponse> execute(FetchRoomByIdQuery query) async {

    Result<Room> roomResult = await _repository.getRoomById(query.id);
    if (roomResult.isError) {
      // error핸들링
      throw roomResult.getError;
    }

    return FetchRoomByIdResponse(roomResult.getValue);
  }
}
