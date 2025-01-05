import 'package:return_king/shared/usecases/command.dart';

class AddRoomCommand implements Command {
  AddRoomCommand({required this.title, required this.createdAt});
  final String title;
  final DateTime createdAt;
}
