import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/features/timeline/presentation/organisms/slide_list_item.dart';

class TimelineTemplate extends ConsumerWidget {
  const TimelineTemplate({super.key, required this.timelineList});

  final List<Timeline> timelineList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: timelineList.length,
      itemBuilder: (context, index) {
        return SlideListItem(timeline: timelineList[index]);
      },
    );
  }
}
