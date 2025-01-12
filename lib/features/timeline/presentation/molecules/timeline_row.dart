import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/features/timeline/domain/models/dto/timeline_dto.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineRow extends StatelessWidget {
  const TimelineRow({
    super.key,
    required this.currentTimelineDto,
    required this.hasPrevious,
    this.prevTimelineDto,
  });

  final TimelineDto currentTimelineDto;
  final TimelineDto? prevTimelineDto;
  final bool hasPrevious;

  @override
  Widget build(BuildContext context) {
    final isSender = currentTimelineDto.senderType == SenderType.other;
    final showHorizontalLine = hasPrevious &&
        prevTimelineDto?.senderType != currentTimelineDto.senderType;
    return Column(
      children: [
        if (showHorizontalLine)
          Row(children: [
            const Spacer(flex: 1), // 왼쪽 여백
            Container(
              height: 6, // 선 두께
              width: MediaQuery.of(context).size.width * 0.79, // 0.8 비율
              color: prevTimelineDto?.senderType == SenderType.me ? Colors.indigo : Colors.deepOrange, // 선 색상
            ),
            const Spacer(flex: 1), // 오른쪽 여백
          ]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
          child: TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: isSender ? 0.9 : 0.1, // 정렬
            isFirst: currentTimelineDto.isFirst,
            isLast: currentTimelineDto.isLast,
            beforeLineStyle: LineStyle(
              color: currentTimelineDto.isFirst
                  ? Colors.transparent
                  : hasPrevious && prevTimelineDto?.senderType == SenderType.me ? Colors.indigo
                      : Colors.deepOrange 
                      ,
              thickness: currentTimelineDto.isFirst ? 0 : 6,
            ),
            afterLineStyle: LineStyle(
              color: currentTimelineDto.isLast
                  ? Colors.transparent
                  : (currentTimelineDto.senderType == SenderType.me
                      ? Colors.indigo
                      : Colors.deepOrange),
              thickness: currentTimelineDto.isLast ? 0 : 6,
            ),
            indicatorStyle: IndicatorStyle(
              width: 40,
              color: currentTimelineDto.senderType == SenderType.me
                  ? Colors.blue
                  : Colors.red,
              iconStyle: IconStyle(
                iconData: Icons.card_giftcard,
                color: Colors.white,
              ),
            ),
            startChild: isSender ? _buildContent(context) : null,
            endChild: isSender ? null : _buildContent(context),
          ),
        )
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final isSender = currentTimelineDto.senderType == SenderType.other;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            currentTimelineDto.senderType == SenderType.other
                ? '내가 받은 선물'
                : '${currentTimelineDto.roomName}에게',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            currentTimelineDto.content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            DateFormat('yyyy/MM/dd').format(currentTimelineDto.giftDate),
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
