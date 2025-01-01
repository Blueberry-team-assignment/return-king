import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/shared/providers/room/room_list_notifier.dart';
import 'package:return_king/shared/providers/timeline/timeline_list_notifier.dart';

final roomListProvider = StateNotifierProvider<RoomListNotifier, List<Room>>(
    (ref) => RoomListNotifier(TimelineListNotifier()));

final selectedRoomProvider = StateProvider<Room?>((ref) => null);
