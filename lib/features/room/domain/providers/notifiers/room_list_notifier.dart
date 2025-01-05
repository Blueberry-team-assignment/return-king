import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/domain/usecases/fetch_all_room/fetch_all_room_query.dart';
import 'package:return_king/features/room/domain/usecases/fetch_all_room/fetch_all_room_response.dart';
import 'package:return_king/features/room/domain/usecases/fetch_all_room/fetch_all_room_usecase.dart';

class RoomListNotifier extends StateNotifier<List<Room>> {
  RoomListNotifier(this.fetchAllRoomUsecase)
      : super([]) {
    fetchRooms();
  }

  FetchAllRoomUsecase fetchAllRoomUsecase;

  Future<void> fetchRooms() async {
    FetchAllRoomResponse allRoomRes =
        await fetchAllRoomUsecase.execute(FetchAllRoomQuery());
    state = allRoomRes.roomList;
  }

  void clearRooms() {
    state = [];
  }
}
