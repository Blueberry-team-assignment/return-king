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
              return SlideListItem(timelineDto: timelineList[index]);
            },
          )
        : const Center(child: Text('등록된 타임라인이 없습니다.'));
  }
}
