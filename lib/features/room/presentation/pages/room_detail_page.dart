import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/presentation/templates/room_detail_template.dart';
import 'package:return_king/features/room/domain/providers/room_providers.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:return_king/features/timeline/domain/providers/timeline_providers.dart';

class RoomDetailPage extends ConsumerWidget {
  const RoomDetailPage({super.key, this.isNewRoom = false});

  final bool isNewRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Room? room = ref.watch(selectedRoomProvider);
    final List<TimelineDto> timelineList =
        ref.watch(selectedTimelineListByRoomIdProvider) ?? [];
    return RoomDetailTemplate(room: room, timelineDtoList: timelineList);
  }
}
