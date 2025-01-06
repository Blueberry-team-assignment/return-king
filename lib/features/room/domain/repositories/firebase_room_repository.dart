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
  Future<Result<Room>> getRoomById(String roomId) async {
    try {
      final querySnapshot = await _firestore
          .collection(Constants.rooms)
          .where(
            Constants.userId,
            isEqualTo: FirebaseAuth.instance.currentUser?.uid,
          )
          .where(Constants.id, isEqualTo: roomId)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        return Result.ok(Room.fromJson(doc.data()));
      } else {
        return Result.error(Exception('Room not Found'));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Room>> saveRoom(Room room) async {
    try {
      final doc = _firestore.collection(Constants.rooms).doc();
      final id = doc.id; // firestore가 생성한 ID
      final data = room
        .copyWith(
          id: id,
          userId: FirebaseAuth.instance.currentUser?.uid ?? '',
          deleted: false,
          lastTimelineId: null,
        )
        .toJson();
      await doc.set(data); // 발행된 Id와 doc id를 일치 시킴
      return Result.ok(Room.fromJson(data));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<bool>> updateTimelineId({
    required String roomId,
    required String timelineId
  }) async {
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
