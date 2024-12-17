
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/providers/room_list_notifier.dart';
import 'package:return_king/features/timeline/providers/timelist_notifier.dart';

final roomListProvider = StateNotifierProvider<RoomListNotifier, List<Room>>(
    (ref) => RoomListNotifier(TimelineNotifier()));