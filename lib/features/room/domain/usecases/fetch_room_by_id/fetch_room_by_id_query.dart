import 'package:return_king/shared/usecases/command.dart';

class FetchRoomByIdQuery implements Command {
  FetchRoomByIdQuery(this.id);
  final String id;
}
