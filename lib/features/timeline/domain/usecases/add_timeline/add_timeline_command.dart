import 'package:return_king/features/room/domain/enums/sender_type.dart';
import 'package:return_king/shared/usecases/command.dart';

class AddTimelineCommand implements Command {
  AddTimelineCommand(
      {required this.roomId,
      required this.senderType,
      required this.content,
      required this.giftDate,
      required this.createdAt});
  final String roomId;
  final SenderType senderType;
  final String content;
  final DateTime giftDate;
  final DateTime createdAt;
}
