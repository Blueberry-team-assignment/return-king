import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/shared/usecases/response.dart';

class FetchAllRoomResponse implements Response {
  FetchAllRoomResponse(this.roomList);

  final List<Room> roomList;
}
