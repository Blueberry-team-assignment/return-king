// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
mixin _$Room {
  String? get id => throw _privateConstructorUsedError; // Room의 고유 ID
  String get userId => throw _privateConstructorUsedError; // firebase의 uid
  String get name => throw _privateConstructorUsedError; // Room 이름
  DateTime get createdAt => throw _privateConstructorUsedError; // 생성 날짜 및 시간
  bool get deleted => throw _privateConstructorUsedError; // 삭제 여부
  String? get lastTimelineId =>
      throw _privateConstructorUsedError; // 최신 Timeline의 ID (nullable)
// ignore: duplicate_ignore
// ignore: invalid_annotation_target
  @JsonKey(includeFromJson: false, includeToJson: false)
  Timeline? get lastTimeline => throw _privateConstructorUsedError;

  /// Serializes this Room to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res, Room>;
  @useResult
  $Res call(
      {String? id,
      String userId,
      String name,
      DateTime createdAt,
      bool deleted,
      String? lastTimelineId,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Timeline? lastTimeline});

  $TimelineCopyWith<$Res>? get lastTimeline;
}

/// @nodoc
class _$RoomCopyWithImpl<$Res, $Val extends Room>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? name = null,
    Object? createdAt = null,
    Object? deleted = null,
    Object? lastTimelineId = freezed,
    Object? lastTimeline = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      lastTimelineId: freezed == lastTimelineId
          ? _value.lastTimelineId
          : lastTimelineId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastTimeline: freezed == lastTimeline
          ? _value.lastTimeline
          : lastTimeline // ignore: cast_nullable_to_non_nullable
              as Timeline?,
    ) as $Val);
  }

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimelineCopyWith<$Res>? get lastTimeline {
    if (_value.lastTimeline == null) {
      return null;
    }

    return $TimelineCopyWith<$Res>(_value.lastTimeline!, (value) {
      return _then(_value.copyWith(lastTimeline: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoomImplCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$$RoomImplCopyWith(
          _$RoomImpl value, $Res Function(_$RoomImpl) then) =
      __$$RoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String userId,
      String name,
      DateTime createdAt,
      bool deleted,
      String? lastTimelineId,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Timeline? lastTimeline});

  @override
  $TimelineCopyWith<$Res>? get lastTimeline;
}

/// @nodoc
class __$$RoomImplCopyWithImpl<$Res>
    extends _$RoomCopyWithImpl<$Res, _$RoomImpl>
    implements _$$RoomImplCopyWith<$Res> {
  __$$RoomImplCopyWithImpl(_$RoomImpl _value, $Res Function(_$RoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? name = null,
    Object? createdAt = null,
    Object? deleted = null,
    Object? lastTimelineId = freezed,
    Object? lastTimeline = freezed,
  }) {
    return _then(_$RoomImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      lastTimelineId: freezed == lastTimelineId
          ? _value.lastTimelineId
          : lastTimelineId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastTimeline: freezed == lastTimeline
          ? _value.lastTimeline
          : lastTimeline // ignore: cast_nullable_to_non_nullable
              as Timeline?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomImpl implements _Room {
  const _$RoomImpl(
      {required this.id,
      required this.userId,
      required this.name,
      required this.createdAt,
      required this.deleted,
      required this.lastTimelineId,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.lastTimeline});

  factory _$RoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomImplFromJson(json);

  @override
  final String? id;
// Room의 고유 ID
  @override
  final String userId;
// firebase의 uid
  @override
  final String name;
// Room 이름
  @override
  final DateTime createdAt;
// 생성 날짜 및 시간
  @override
  final bool deleted;
// 삭제 여부
  @override
  final String? lastTimelineId;
// 최신 Timeline의 ID (nullable)
// ignore: duplicate_ignore
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Timeline? lastTimeline;

  @override
  String toString() {
    return 'Room(id: $id, userId: $userId, name: $name, createdAt: $createdAt, deleted: $deleted, lastTimelineId: $lastTimelineId, lastTimeline: $lastTimeline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.lastTimelineId, lastTimelineId) ||
                other.lastTimelineId == lastTimelineId) &&
            (identical(other.lastTimeline, lastTimeline) ||
                other.lastTimeline == lastTimeline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, name, createdAt,
      deleted, lastTimelineId, lastTimeline);

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      __$$RoomImplCopyWithImpl<_$RoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomImplToJson(
      this,
    );
  }
}

abstract class _Room implements Room {
  const factory _Room(
      {required final String? id,
      required final String userId,
      required final String name,
      required final DateTime createdAt,
      required final bool deleted,
      required final String? lastTimelineId,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Timeline? lastTimeline}) = _$RoomImpl;

  factory _Room.fromJson(Map<String, dynamic> json) = _$RoomImpl.fromJson;

  @override
  String? get id; // Room의 고유 ID
  @override
  String get userId; // firebase의 uid
  @override
  String get name; // Room 이름
  @override
  DateTime get createdAt; // 생성 날짜 및 시간
  @override
  bool get deleted; // 삭제 여부
  @override
  String? get lastTimelineId; // 최신 Timeline의 ID (nullable)
// ignore: duplicate_ignore
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Timeline? get lastTimeline;

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
