import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/domain/usecases/fetch_all_room/fetch_all_room_query.dart';
import 'package:return_king/features/room/domain/usecases/fetch_all_room/fetch_all_room_response.dart';
import 'package:return_king/features/room/domain/usecases/fetch_all_room/fetch_all_room_usecase.dart';

class RoomListNotifier extends StateNotifier<List<Room>> {
  RoomListNotifier(this.fetchAllRoomUsecase) : super([]) {
    fetchRooms();
  }

  final FetchAllRoomUsecase fetchAllRoomUsecase;

  Future<void> fetchRooms() async {
    FetchAllRoomResponse allRoomRes =
        await fetchAllRoomUsecase.execute(FetchAllRoomQuery());
    asc();
    state = allRoomRes.roomList;
  }

  void desc() {
    state.sort((a, b) =>
        b.createdAt.millisecondsSinceEpoch -
        a.createdAt.millisecondsSinceEpoch);
  }

  void asc() {
    state.sort((a, b) =>
        a.createdAt.millisecondsSinceEpoch -
        b.createdAt.millisecondsSinceEpoch);
  }

  void clearRooms() {
    Future(() {
      state = [];
    });
  }
}
