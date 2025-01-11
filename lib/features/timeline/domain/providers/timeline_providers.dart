import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/providers/room_providers.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:return_king/features/timeline/domain/providers/notifiers/timeline_list_notifier.dart';
import 'package:return_king/features/timeline/domain/providers/notifiers/timeline_notifier.dart';
import 'package:return_king/features/timeline/domain/repositories/firebase_timeline_repository.dart';
import 'package:return_king/features/timeline/domain/repositories/i_timeline_repository.dart';
import 'package:return_king/features/timeline/domain/usecases/add_timeline/add_timeline_usecase.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_all_timeline/fetch_all_timeline_usecase.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline_by_room/fetch_timeline_by_room_usecase.dart';
import 'package:return_king/shared/providers/providers.dart';

final hasRoomsProvider = StateProvider<bool>((ref) => false);

final timelineListProvider =
    StateNotifierProvider<TimelineListNotifier, List<TimelineDto>>(
        (ref) => TimelineListNotifier(
              ref.read(fetchAllTimelineUsecaseProvider),
            ));

final selectedTimelineListByRoomIdProvider =
    StateNotifierProvider<TimelineNotifier, List<TimelineDto>>((ref) =>
        TimelineNotifier(ref.read(fetchTimelineByRoomUsecaseProvider),
            ref.read(addTimelineUsecaseProvider)));

final timelineRepositoryProvider = Provider<ITimelineRepository>(
    (ref) => FirebaseTimelineRepository(ref.read(firebaseFirestoreProvider)));

// DI: timeline추가 상세로직
final addTimelineUsecaseProvider = Provider<AddTimelineUsecase>((ref) {
  return AddTimelineUsecase(
      ref.read(timelineRepositoryProvider), ref.read(roomRepositoryProvider));
});

// DI: 유저 별 모든 timeline 리스트 취득 로직
final fetchAllTimelineUsecaseProvider =
    Provider<FetchAllTimelineUsecase>((ref) {
  return FetchAllTimelineUsecase(
      ref.read(timelineRepositoryProvider), ref.read(roomRepositoryProvider));
});

// DI: room 별 timeline 리스트 취득 로직
final fetchTimelineByRoomUsecaseProvider =
    Provider<FetchTimelineByRoomUsecase>((ref) {
  return FetchTimelineByRoomUsecase(
      ref.read(timelineRepositoryProvider), ref.read(roomRepositoryProvider));
});
