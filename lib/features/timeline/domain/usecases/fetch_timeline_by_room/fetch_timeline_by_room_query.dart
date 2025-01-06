import 'package:return_king/shared/usecases/command.dart';

class FetchTimelineByRoomQuery implements Command {
  FetchTimelineByRoomQuery({required this.roomId});
  final String roomId;
}
