// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../timeline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Timeline _$TimelineFromJson(Map<String, dynamic> json) {
  return _Timeline.fromJson(json);
}

/// @nodoc
mixin _$Timeline {
  String? get id => throw _privateConstructorUsedError; // Timeline 고유 ID
  String get roomId => throw _privateConstructorUsedError; // 연결된 Room의 ID
  String get userId => throw _privateConstructorUsedError; // firebase의 uid
  SenderType get senderType =>
      throw _privateConstructorUsedError; // 발신자 타입 (예: "user", "system")
  String get content => throw _privateConstructorUsedError; // 메시지 내용
  DateTime get giftDate => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError; // 생성 날짜 및 시간
  bool get deleted => throw _privateConstructorUsedError;

  /// Serializes this Timeline to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Timeline
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimelineCopyWith<Timeline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineCopyWith<$Res> {
  factory $TimelineCopyWith(Timeline value, $Res Function(Timeline) then) =
      _$TimelineCopyWithImpl<$Res, Timeline>;
  @useResult
  $Res call(
      {String? id,
      String roomId,
      String userId,
      SenderType senderType,
      String content,
      DateTime giftDate,
      DateTime createdAt,
      bool deleted});
}

/// @nodoc
class _$TimelineCopyWithImpl<$Res, $Val extends Timeline>
    implements $TimelineCopyWith<$Res> {
  _$TimelineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Timeline
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? roomId = null,
    Object? userId = null,
    Object? senderType = null,
    Object? content = null,
    Object? giftDate = null,
    Object? createdAt = null,
    Object? deleted = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      senderType: null == senderType
          ? _value.senderType
          : senderType // ignore: cast_nullable_to_non_nullable
              as SenderType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      giftDate: null == giftDate
          ? _value.giftDate
          : giftDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimelineImplCopyWith<$Res>
    implements $TimelineCopyWith<$Res> {
  factory _$$TimelineImplCopyWith(
          _$TimelineImpl value, $Res Function(_$TimelineImpl) then) =
      __$$TimelineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String roomId,
      String userId,
      SenderType senderType,
      String content,
      DateTime giftDate,
      DateTime createdAt,
      bool deleted});
}

/// @nodoc
class __$$TimelineImplCopyWithImpl<$Res>
    extends _$TimelineCopyWithImpl<$Res, _$TimelineImpl>
    implements _$$TimelineImplCopyWith<$Res> {
  __$$TimelineImplCopyWithImpl(
      _$TimelineImpl _value, $Res Function(_$TimelineImpl) _then)
      : super(_value, _then);

  /// Create a copy of Timeline
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? roomId = null,
    Object? userId = null,
    Object? senderType = null,
    Object? content = null,
    Object? giftDate = null,
    Object? createdAt = null,
    Object? deleted = null,
  }) {
    return _then(_$TimelineImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      senderType: null == senderType
          ? _value.senderType
          : senderType // ignore: cast_nullable_to_non_nullable
              as SenderType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      giftDate: null == giftDate
          ? _value.giftDate
          : giftDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimelineImpl implements _Timeline {
  const _$TimelineImpl(
      {required this.id,
      required this.roomId,
      required this.userId,
      required this.senderType,
      required this.content,
      required this.giftDate,
      required this.createdAt,
      required this.deleted});

  factory _$TimelineImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimelineImplFromJson(json);

  @override
  final String? id;
// Timeline 고유 ID
  @override
  final String roomId;
// 연결된 Room의 ID
  @override
  final String userId;
// firebase의 uid
  @override
  final SenderType senderType;
// 발신자 타입 (예: "user", "system")
  @override
  final String content;
// 메시지 내용
  @override
  final DateTime giftDate;
  @override
  final DateTime createdAt;
// 생성 날짜 및 시간
  @override
  final bool deleted;

  @override
  String toString() {
    return 'Timeline(id: $id, roomId: $roomId, userId: $userId, senderType: $senderType, content: $content, giftDate: $giftDate, createdAt: $createdAt, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimelineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.senderType, senderType) ||
                other.senderType == senderType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.giftDate, giftDate) ||
                other.giftDate == giftDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, roomId, userId, senderType,
      content, giftDate, createdAt, deleted);

  /// Create a copy of Timeline
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimelineImplCopyWith<_$TimelineImpl> get copyWith =>
      __$$TimelineImplCopyWithImpl<_$TimelineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimelineImplToJson(
      this,
    );
  }
}

abstract class _Timeline implements Timeline {
  const factory _Timeline(
      {required final String? id,
      required final String roomId,
      required final String userId,
      required final SenderType senderType,
      required final String content,
      required final DateTime giftDate,
      required final DateTime createdAt,
      required final bool deleted}) = _$TimelineImpl;

  factory _Timeline.fromJson(Map<String, dynamic> json) =
      _$TimelineImpl.fromJson;

  @override
  String? get id; // Timeline 고유 ID
  @override
  String get roomId; // 연결된 Room의 ID
  @override
  String get userId; // firebase의 uid
  @override
  SenderType get senderType; // 발신자 타입 (예: "user", "system")
  @override
  String get content; // 메시지 내용
  @override
  DateTime get giftDate;
  @override
  DateTime get createdAt; // 생성 날짜 및 시간
  @override
  bool get deleted;

  /// Create a copy of Timeline
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimelineImplCopyWith<_$TimelineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
