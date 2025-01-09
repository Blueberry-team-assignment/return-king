import 'package:return_king/features/room/domain/enums/sender_type.dart';

class TimelineDto {
  final String id;
  final String roomId;
  final String roomName; // 룸 이름
  final String content;
  final SenderType senderType;
  final DateTime createdAt;

  TimelineDto(this.id, this.roomId, this.roomName, this.content,
      this.senderType, this.createdAt);
}
