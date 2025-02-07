import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/domain/usecases/add_room/add_room_command.dart';
import 'package:return_king/features/room/domain/usecases/add_room/add_room_response.dart';
import 'package:return_king/features/room/domain/usecases/add_room/add_room_usecase.dart';
import 'package:return_king/features/room/domain/usecases/fetch_room_by_id/fetch_room_by_id_response.dart';
import 'package:return_king/features/room/domain/usecases/fetch_room_by_id/fetch_room_by_id_usecase.dart';
import 'package:return_king/features/room/domain/usecases/fetch_room_by_id/fetch_room_by_id_query.dart';
import 'package:return_king/shared/result.dart';

class RoomNotifier extends StateNotifier<Room?> {
  RoomNotifier(this.addRoomUsecase, this.fetchRoomByIdUsecase) : super(null);

  final AddRoomUsecase addRoomUsecase;
  final FetchRoomByIdUsecase fetchRoomByIdUsecase;
  // String roomId;

  Future<Result<Room>> fetchRoom(String roomId) async {
    FetchRoomByIdResponse res =
        await fetchRoomByIdUsecase.execute(FetchRoomByIdQuery(roomId));
    state = res.room;
    return Result.ok(state!);
  }

  /// TODO
  /// add room은 room에서? 혹은 roomList에서?
  Future<Result<Room>> addRoom(
      {required String title, required DateTime createdAt}) async {
    AddRoomResponse res = await addRoomUsecase
        .execute(AddRoomCommand(title: title, createdAt: createdAt));
    state = res.room;
    return Result.ok(state);
  }

  Future<void> updatedLastTimelineId(String timelineId) async {
    if (state != null) {
      throw Exception('not exists selected room');
    }
  }

  void clearSelectedRoom() {
    if (state != null) {
      state = null;
    } else {
      debugPrint('selected room is already null');
    }
  }
}
