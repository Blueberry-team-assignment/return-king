import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineRow extends StatelessWidget {
  const TimelineRow({super.key, required this.timelineDto});

  final TimelineDto timelineDto;

  @override
  Widget build(BuildContext context) {
    final isSender = timelineDto.senderType == SenderType.sender;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: isSender ? 0.9 : 0.1, // 정렬
        isFirst: timelineDto.isFirst,
        isLast: timelineDto.isLast,
        beforeLineStyle: LineStyle(
          color: timelineDto.isFirst
              ? Colors.transparent
              : (timelineDto.senderType == SenderType.receiver
                  ? Colors.indigo
                  : Colors.deepOrange),
          thickness: timelineDto.isFirst ? 0 : 6,
        ),
        afterLineStyle: LineStyle(
          color: timelineDto.isLast
              ? Colors.transparent
              : (timelineDto.senderType == SenderType.receiver
                  ? Colors.indigo
                  : Colors.deepOrange),
          thickness: timelineDto.isLast ? 0 : 6,
        ),
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: timelineDto.senderType == SenderType.receiver
              ? Colors.blue
              : Colors.red,
          iconStyle: IconStyle(
            iconData:  Icons.card_giftcard,
            color: Colors.white,
          ),
        ),
        startChild: isSender ? _buildContent(context) : null,
        endChild: isSender ? null : _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final isSender = timelineDto.senderType == SenderType.sender;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            timelineDto.senderType == SenderType.sender
                ? '내가 받은 선물'
                : '${timelineDto.roomName}에게',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            timelineDto.content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            DateFormat('yyyy/MM/dd').format(timelineDto.giftDate),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}