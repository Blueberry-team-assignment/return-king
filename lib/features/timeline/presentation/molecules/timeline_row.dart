import 'package:flutter/material.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/shared/presentation/atoms/avatar.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/shared/utils.dart';

class TimelineRow extends StatelessWidget {
  const TimelineRow({super.key, this.room, required this.timeline});

  final Room? room;
  final Timeline timeline;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      const Avatar(),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: getCrossAlign(timeline),
        children: [
          room != null ? Text(room!.name) : const SizedBox(),
          Column(
            crossAxisAlignment: getCrossAlign(timeline),
            children: [
              Text(timeline.roomId),
              Text(timeline.content),
              Text(timeline.createdAt.toIso8601String()),
            ],
          )
        ],
      )
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Row(
        mainAxisAlignment: getMainAlign(timeline),
        children: [
          if (SenderType.receiver == timeline.senderType)
            ...[...children].reversed
          else
            ...children
        ],
      ),
    );
  }
}