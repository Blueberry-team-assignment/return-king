import 'package:flutter/material.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:return_king/shared/presentation/atoms/avatar.dart';
import 'package:return_king/shared/utils.dart';

class TimelineRow extends StatelessWidget {
  const TimelineRow({super.key, this.room, required this.timelineDto});

  final Room? room;
  final TimelineDto timelineDto;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      const Avatar(),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: getCrossAlign(timelineDto),
        children: [
          room != null ? Text(room!.name) : const SizedBox(),
          Column(
            crossAxisAlignment: getCrossAlign(timelineDto),
            children: [
              Text(timelineDto.roomId),
              Text(timelineDto.content),
              Text(timelineDto.createdAt.toIso8601String()),
            ],
          )
        ],
      )
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Row(
        mainAxisAlignment: getMainAlign(timelineDto),
        children: [
          if (SenderType.receiver == timelineDto.senderType)
            ...[...children].reversed
          else
            ...children
        ],
      ),
    );
  }
}
