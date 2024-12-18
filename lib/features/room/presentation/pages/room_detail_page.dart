import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/presentation/templates/room_detail_template.dart';
import 'package:return_king/features/room/providers/room_providers.dart';

class RoomDetailPage extends ConsumerWidget {
  const RoomDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Room room = ref.watch(selectedRoomProvider)!;
    return RoomDetailTemplate(room: room);
  }
}
