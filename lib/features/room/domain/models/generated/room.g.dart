// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      deleted: json['deleted'] as bool,
      lastTimelineId: json['lastTimelineId'] as String?,
      lastTimeline: json['lastTimeline'] == null
          ? null
          : Timeline.fromJson(json['lastTimeline'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'deleted': instance.deleted,
      'lastTimelineId': instance.lastTimelineId,
      'lastTimeline': instance.lastTimeline,
    };