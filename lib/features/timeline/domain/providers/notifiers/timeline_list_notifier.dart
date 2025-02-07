import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_all_timeline/fetch_all_timeline_query.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_all_timeline/fetch_all_timeline_response.dart';
import 'package:return_king/features/timeline/domain/usecases/fetch_all_timeline/fetch_all_timeline_usecase.dart';

class TimelineListNotifier extends StateNotifier<List<TimelineDto>> {
  TimelineListNotifier(this.fetchAllTimelineUsecase) : super([]);

  final FetchAllTimelineUsecase fetchAllTimelineUsecase;

  Future<void> fetchAllTimeline() async {
    FetchAllTimelineResponse res =
        await fetchAllTimelineUsecase.execute(FetchAllTimelineQuery());
    state = res.timelines;
  }

  void clearTimeline() {
    Future(() {
      if (state.isNotEmpty) {
        state = [];
      }
    });
  }
}
