import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/presentation/templates/room_detail_template.dart';
import 'package:return_king/shared/providers/room/room_providers.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/shared/providers/timeline/timeline_providers.dart';

class RoomDetailPage extends ConsumerWidget {
  const RoomDetailPage({super.key, this.isNewRoom = false});

  final bool isNewRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Room? room = ref.watch(selectedRoomProvider);
    final List<Timeline> timelineList =
        ref.watch(selectedTimelineListByRoomIdProvider) ?? [];
    return RoomDetailTemplate(room: room, timelineList: timelineList);
  }
}
