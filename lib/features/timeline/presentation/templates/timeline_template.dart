import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:return_king/features/timeline/presentation/organisms/slide_list_item.dart';

class TimelineTemplate extends ConsumerWidget {
  const TimelineTemplate({super.key, required this.timelineList});

  final List<TimelineDto> timelineList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return timelineList.isNotEmpty
        ? ListView.builder(
            itemCount: timelineList.length,
            itemBuilder: (context, index) {
              final hasPrevious = index > 0;
              final previousTimeline = hasPrevious ? timelineList[index - 1] : null;
              final currentTimeline = timelineList[index];
              return SlideListItem(currentTimelineDto: currentTimeline, prevTimelineDto: previousTimeline, hasPrevious: hasPrevious);
            },
          )
        : const Center(child: Text('등록된 타임라인이 없습니다.'));
  }
}
