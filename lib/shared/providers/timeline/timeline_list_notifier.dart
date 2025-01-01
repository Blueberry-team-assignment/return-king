import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';

class TimelineListNotifier extends StateNotifier<List<Timeline>> {
  TimelineListNotifier() : super([]) {
    fetchAllTimeline();
  }

  Future<void> fetchAllTimeline() async {
    var db = FirebaseFirestore.instance;
    var timelineSnapshot = await db
        .collection('timelines')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();

    List<Timeline> timelines = timelineSnapshot.docs.map((x) => Timeline.fromJson(x.data())).toList();

    state = timelines;
  }

  Future<List<Timeline>> getAllTimeline() async {
    return state;
  }

  Future<List<Timeline>> getTimeLineByRoomId(String roomId) async {
    await fetchAllTimeline();
    return state.where((x) => x.roomId == roomId).toList();
  }

  void clearTimeline() {
    state = [];
  }
}
