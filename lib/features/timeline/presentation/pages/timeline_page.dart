import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/features/timeline/presentation/templates/timeline_template.dart';
import 'package:return_king/features/timeline/domain/providers/timeline_providers.dart';

class TimelinePage extends ConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(timelineListProvider.notifier).fetchAllTimeline();
    List<Timeline> timelineList = ref.watch(timelineListProvider);
    return TimelineTemplate(timelineList: timelineList);
  }
}
