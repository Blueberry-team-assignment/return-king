// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimelineImpl _$$TimelineImplFromJson(Map<String, dynamic> json) =>
    _$TimelineImpl(
      id: json['id'] as String,
      roomId: json['roomId'] as String,
      senderType: json['senderType'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$TimelineImplToJson(_$TimelineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomId': instance.roomId,
      'senderType': instance.senderType,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'deleted': instance.deleted,
    };
