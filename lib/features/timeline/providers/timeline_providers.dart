import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/features/timeline/providers/timeline_list_notifier.dart';

final hasRoomsProvider = StateProvider<bool>((ref) => false);

final timelineListProvider = StateNotifierProvider<TimelineListNotifier, List<Timeline>>(
    (ref) => TimelineListNotifier());

final selectedTimelineListByRoomIdProvider = StateProvider<List<Timeline>?>((ref) => []);