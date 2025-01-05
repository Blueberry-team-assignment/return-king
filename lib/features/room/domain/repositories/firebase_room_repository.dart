import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:return_king/features/room/domain/models/room.dart';
import 'package:return_king/features/room/domain/repositories/i_room_repository.dart';
import 'package:return_king/shared/constants.dart';
import 'package:return_king/shared/result.dart';

class FirebaseRoomRepository implements IRoomRepository {
  FirebaseRoomRepository(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<Result<List<Room>>> getAllRoomList() async {
    try {
      final querySnapshot = await _firestore
          .collection(Constants.rooms)
          .where(Constants.userId,
              isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
      final data =
          querySnapshot.docs.map((doc) => Room.fromJson(doc.data())).toList();
      return Result.ok(data);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<Room>>> getRoomByRoomId(String roomId) async {
    try {
      final querySnapshot = await _firestore
          .collection(Constants.rooms)
          .where(Constants.userId,
              isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
      final data =
          querySnapshot.docs.map((doc) => Room.fromJson(doc.data())).toList();
      return Result.ok(data);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Room>> saveRoom(Room room) async {
    try {
      var id = _firestore.collection(Constants.rooms).doc().id;
      var data = room
          .copyWith(
            id: id,
            userId: FirebaseAuth.instance.currentUser?.uid ?? '',
            deleted: false,
            lastTimelineId: null,
          )
          .toJson();
      await _firestore.collection(Constants.rooms).add(data);
      return Result.ok(Room.fromJson(data));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<bool>> updateTimelineId(
      String roomId, String timelineId) async {
    try {
      await _firestore
          .collection(Constants.rooms)
          .doc(roomId)
          .update({"lastTimelineId": timelineId});
      return Result.ok(true);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
