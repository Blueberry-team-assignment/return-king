import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/shared/usecases/response.dart';

class FetchRoomByIdResponse implements Response {
  FetchRoomByIdResponse(this.room);

  final Room room;
}
