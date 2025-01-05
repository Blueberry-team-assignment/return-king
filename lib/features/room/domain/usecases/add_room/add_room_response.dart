import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/shared/usecases/response.dart';

class AddRoomResponse implements Response {
  AddRoomResponse(this.room);
  final Room room;
}
