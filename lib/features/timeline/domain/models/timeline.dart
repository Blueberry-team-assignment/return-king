import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';

part 'generated/timeline.freezed.dart';
part 'generated/timeline.g.dart';

@freezed
class Timeline with _$Timeline {
  const factory Timeline({
    required String? id, // Timeline 고유 ID
    required String roomId, // 연결된 Room의 ID
    required String userId, // firebase의 uid
    required SenderType senderType, // 발신자 타입 (예: "user", "system")
    required String content, // 메시지 내용
    required DateTime createdAt, // 생성 날짜 및 시간
    required bool deleted, // 삭제 여부
  }) = _Timeline;

  factory Timeline.fromJson(Map<String, dynamic> json) =>
      _$TimelineFromJson(json);
}
