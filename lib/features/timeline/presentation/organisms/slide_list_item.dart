import 'package:flutter/material.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:return_king/features/timeline/presentation/molecules/timeline_row.dart';

class SlideListItem extends StatelessWidget {
  const SlideListItem({
      super.key,
      this.room, 
      required this.currentTimelineDto,
      required this.hasPrevious,
      this.prevTimelineDto,
    });

  final Room? room;
  final TimelineDto currentTimelineDto;
  final TimelineDto? prevTimelineDto;
  final bool hasPrevious;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(currentTimelineDto.id),
      background: Container(color: Colors.green),
      secondaryBackground: Container(
        color: Colors.red,
        child: const Expanded(child: Text('받은 선물!')),
      ),
      onDismissed: (direction) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${currentTimelineDto.id}를 삭제 했습니다.')),
        );
      },
      child: TimelineRow(currentTimelineDto: currentTimelineDto, prevTimelineDto: prevTimelineDto, hasPrevious: hasPrevious),
    );
  }
}
