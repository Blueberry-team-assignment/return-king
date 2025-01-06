import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/domain/providers/notifiers/room_list_notifier.dart';
import 'package:return_king/features/room/domain/providers/notifiers/room_notifier.dart';
import 'package:return_king/features/room/domain/repositories/firebase_room_repository.dart';
import 'package:return_king/features/room/domain/repositories/i_room_repository.dart';
import 'package:return_king/features/room/domain/usecases/add_room/add_room_usecase.dart';
import 'package:return_king/features/room/domain/usecases/fetch_all_room/fetch_all_room_usecase.dart';
import 'package:return_king/features/room/domain/usecases/fetch_room_by_id/fetch_room_by_id_usecase.dart';
import 'package:return_king/features/timeline/domain/providers/timeline_providers.dart';
import 'package:return_king/shared/providers/providers.dart';

/// 상태관리 관련 Start
/// room list에 대한 상태관리용
final roomListProvider = StateNotifierProvider<RoomListNotifier, List<Room>>(
    (ref) => RoomListNotifier(ref.read(fetchAllRoomUsecaseProvider)));

/// 선택된 room에 대한 상태관리용
final selectedRoomProvider = StateNotifierProvider<RoomNotifier, Room?>((ref) {
  return RoomNotifier(
    ref.read(addRoomUsecaseProvider),
    ref.read(fetchRoomByIdUsecaseProvider)
  );
});

/// 상태관리 관련 End

/// DI Start
// DI: room의 저장소
final roomRepositoryProvider = Provider<IRoomRepository>((ref) {
  return FirebaseRoomRepository(ref.read(firebaseFirestoreProvider));
});

// DI: room추가 상세로직
final addRoomUsecaseProvider = Provider<AddRoomUsecase>((ref) {
  return AddRoomUsecase(ref.read(roomRepositoryProvider));
});

// DI: 유저 별 모든 room취득 상세로직
final fetchAllRoomUsecaseProvider = Provider<FetchAllRoomUsecase>((ref) {
  return FetchAllRoomUsecase(
      ref.read(roomRepositoryProvider), ref.read(timelineRepositoryProvider));
});

// DI: id별 room취득 상세로직
final fetchRoomByIdUsecaseProvider = Provider<FetchRoomByIdUsecase>((ref) {
  return FetchRoomByIdUsecase(ref.read(roomRepositoryProvider));
});

/// DI End
