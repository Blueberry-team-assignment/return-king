import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/timeline.freezed.dart';
part 'generated/timeline.g.dart';

@freezed
class Timeline with _$Timeline {
  const factory Timeline({
    required String id, // Timeline 고유 ID
    required String roomId, // 연결된 Room의 ID
    required String senderType, // 발신자 타입 (예: "user", "system")
    required String content, // 메시지 내용
    required DateTime createdAt, // 생성 날짜 및 시간
    required bool deleted, // 삭제 여부
  }) = _Timeline;

  factory Timeline.fromJson(Map<String, dynamic> json) =>
      _$TimelineFromJson(json);
}
