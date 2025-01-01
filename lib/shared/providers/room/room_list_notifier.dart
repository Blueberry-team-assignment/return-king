import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/shared/providers/timeline/timeline_list_notifier.dart';

class RoomListNotifier extends StateNotifier<List<Room>> {
  RoomListNotifier(this.timelineListNotifier) : super([]) {
    fetchRooms();
  }
  final TimelineListNotifier timelineListNotifier;

  Future<void> fetchRooms() async {
    var db = FirebaseFirestore.instance;
    var userId = FirebaseAuth.instance.currentUser?.uid;
    var roomsSnapshot = await db
        .collection('rooms')
        .where('userId', isEqualTo: userId).get();

    List<Room> rooms = [];

    for (var roomDoc in roomsSnapshot.docs) {
      Room roomData = Room.fromJson(roomDoc.data());
      if (roomData.lastTimelineId != null) {
        var timelineSnapshot =
            await db.collection('timelines').doc(roomData.lastTimelineId).get();
        rooms.add(Room.fromJson({
          ...roomDoc.data(),
          'lastTimeline': Timeline.fromJson(timelineSnapshot.data()!)
        }));
      } else {
        rooms.add(roomData);
      }
    }
    state = rooms;
  }

  void clearRooms() {
    state = [];
  }
}
