// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimelineImpl _$$TimelineImplFromJson(Map<String, dynamic> json) =>
    _$TimelineImpl(
      id: json['id'] as String?,
      roomId: json['roomId'] as String,
      userId: json['userId'] as String,
      senderType: $enumDecode(_$SenderTypeEnumMap, json['senderType']),
      content: json['content'] as String,
      giftDate: DateTime.parse(json['giftDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$TimelineImplToJson(_$TimelineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomId': instance.roomId,
      'userId': instance.userId,
      'senderType': _$SenderTypeEnumMap[instance.senderType]!,
      'content': instance.content,
      'giftDate': instance.giftDate.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'deleted': instance.deleted,
    };

const _$SenderTypeEnumMap = {
  SenderType.me: 'me',
  SenderType.other: 'other',
};
