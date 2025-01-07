import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:return_king/features/timeline/domain/repositories/i_timeline_repository.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';
import 'package:return_king/shared/constants.dart';
import 'package:return_king/shared/result.dart';

class FirebaseTimelineRepository implements ITimelineRepository {
  FirebaseTimelineRepository(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<Result<List<Timeline>>> getAllTimelines() async {
    try {
      final querySnapshot = await _firestore
          .collection(Constants.timelines)
          .where(Constants.userId,
              isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
      final result = querySnapshot.docs
          .map((doc) => Timeline.fromJson(doc.data()))
          .toList();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Timeline>> saveTimeline(Timeline timeline) async {
    try {
      var doc = _firestore.collection(Constants.timelines).doc();
      var data = timeline
          .copyWith(
              id: doc.id,
              userId: FirebaseAuth.instance.currentUser?.uid ?? '',
              deleted: false)
          .toJson();
      await doc.set(data); // id == doc id
      return Result.ok(Timeline.fromJson(data));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<Timeline>>> getTimelinesByRoomId(String roomId) async {
    try {
      final querySnapshot = await _firestore
          .collection(Constants.timelines)
          .where(Constants.userId,
              isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .where(Constants.roomId, isEqualTo: roomId)
          .get();
      final result = querySnapshot.docs
          .map((doc) => Timeline.fromJson(doc.data()))
          .toList();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
