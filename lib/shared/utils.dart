import 'package:flutter/material.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';

bool isRightAlign(TimelineDto timelineDto) {
  return SenderType.receiver == timelineDto.senderType;
}

MainAxisAlignment getMainAlign(TimelineDto timelineDto) {
  return isRightAlign(timelineDto)
      ? MainAxisAlignment.end
      : MainAxisAlignment.start;
}

CrossAxisAlignment getCrossAlign(TimelineDto timelineDto) {
  return isRightAlign(timelineDto)
      ? CrossAxisAlignment.end
      : CrossAxisAlignment.start;
}
