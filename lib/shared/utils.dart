import 'package:flutter/material.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/features/timeline/domain/models/timeline.dart';

bool isRightAlign(Timeline timeline) {
  return SenderType.receiver == timeline.senderType;
}

MainAxisAlignment getMainAlign(Timeline timeline) {
  return isRightAlign(timeline)
      ? MainAxisAlignment.end
      : MainAxisAlignment.start;
}

CrossAxisAlignment getCrossAlign(Timeline timeline) {
  return isRightAlign(timeline)
      ? CrossAxisAlignment.end
      : CrossAxisAlignment.start;
}
