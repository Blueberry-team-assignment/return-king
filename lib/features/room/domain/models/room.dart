import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';

part 'generated/room.freezed.dart';
part 'generated/room.g.dart';

@freezed
class Room with _$Room {
  const factory Room({
    required String id, // Room의 고유 ID
    required String name, // Room 이름
    required DateTime createdAt, // 생성 날짜 및 시간
    required bool deleted, // 삭제 여부
    String? lastTimelineId, // 최신 Timeline의 ID (nullable)
    Timeline? lastTimeline, // 최신 Timeline (nullable)
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
