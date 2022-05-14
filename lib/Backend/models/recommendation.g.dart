// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) =>
    Recommendation(
      id: json['id'] as String,
      recoDate: DateTime.parse(json['recoDate'] as String),
      terraRequestId: json['terraRequestId'] as String,
      gameOneId: json['gameOneId'] as String,
      gameTwoId: json['gameTwoId'] as String,
      gameThreeId: json['gameThreeId'] as String,
    )..choice = json['choice'] as int;

Map<String, dynamic> _$RecommendationToJson(Recommendation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recoDate': instance.recoDate.toIso8601String(),
      'terraRequestId': instance.terraRequestId,
      'gameOneId': instance.gameOneId,
      'gameTwoId': instance.gameTwoId,
      'gameThreeId': instance.gameThreeId,
      'choice': instance.choice,
    };
