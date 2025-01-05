import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/features/timeline/domain/usecases/add_timeline/add_timeline_command.dart';
import 'package:return_king/features/timeline/domain/usecases/add_timeline/add_timeline_result.dart';
import 'package:return_king/features/timeline/domain/usecases/add_timeline/add_timeline_usecase.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline/fetch_timeline_query.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline/fetch_timeline_result.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_timeline/fetch_timeline_usecase.dart';
import 'package:return_king/shared/result.dart';

class TimelineListNotifier extends StateNotifier<List<Timeline>> {
  TimelineListNotifier(this.addTimelineUsecase, this.fetchTimelineUsecase)
      : super([]) {
    fetchAllTimeline();
  }

  final AddTimelineUsecase addTimelineUsecase;
  final FetchTimelineUsecase fetchTimelineUsecase;

  Future<void> fetchAllTimeline() async {
    FetchTimelineResponse res = await fetchTimelineUsecase.execute(FetchTimelineQuery());
    state = res.timelines;
  }

  Future<List<Timeline>> getAllTimeline() async {
    return state;
  }

  Future<Result<Timeline>> addTimeline(
      {required String roomId,
      required SenderType senderType,
      required String content,
      required DateTime createdAt}) async {
    AddTimelineResponse addTimelineUsecaseResult =
        await addTimelineUsecase.execute(AddTimelineCommand(
            roomId: roomId,
            senderType: senderType,
            content: content,
            createdAt: createdAt));
    state = [...state, addTimelineUsecaseResult.timeline];
    return Result.ok(addTimelineUsecaseResult.timeline);
  }

  void clearTimeline() {
    state = [];
  }
}
