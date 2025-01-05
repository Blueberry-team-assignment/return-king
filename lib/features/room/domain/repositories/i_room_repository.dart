import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/shared/result.dart';

abstract class IRoomRepository {
  Future<Result<List<Room>>> getAllRoomList();
  Future<Result<List<Room>>> getRoomByRoomId(String roomId);
  Future<Result<Room>> saveRoom(Room room);
  Future<Result<bool>> updateTimelineId(String roomId, String timelineId);
}
