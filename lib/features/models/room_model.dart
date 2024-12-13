import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/room_model.freezed.dart';
part 'generated/room_model.g.dart';

@freezed
class RoomState with _$RoomState {
  const factory RoomState({
    required int id,
  }) = _RoomState;
  factory RoomState.fromJson(Map<String, dynamic> json) =>
      _$RoomStateFromJson(json);
}
