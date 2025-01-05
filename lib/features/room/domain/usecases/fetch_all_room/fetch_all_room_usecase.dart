import 'package:return_king/features/room/domain/repositories/i_room_repository.dart';
import 'package:return_king/features/room/domain/usecases/fetch_all_room/fetch_all_room_query.dart';
import 'package:return_king/features/room/domain/usecases/fetch_all_room/fetch_all_room_response.dart';
import 'package:return_king/shared/usecases/usecase.dart';

class FetchAllRoomUsecase implements Usecase<FetchAllRoomQuery, FetchAllRoomResponse> {
  final IRoomRepository _repository;

  FetchAllRoomUsecase(this._repository);

  @override
  Future<FetchAllRoomResponse> execute(FetchAllRoomQuery query) async {
    var roomListResult = await _repository.getAllRoomList();
    if (roomListResult.isError) {
      throw roomListResult.getError;
    }
    return FetchAllRoomResponse(roomListResult.getValue);
  }
}
