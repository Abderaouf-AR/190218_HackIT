// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gamer _$GamerFromJson(Map<String, dynamic> json) => Gamer(
      id: json['id'] as String,
      gamerName: json['gamerName'] as String,
      age: json['age'] as int,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => $enumDecode(_$CategoryEnumEnumMap, e))
          .toList(),
      platforms: (json['platforms'] as List<dynamic>)
          .map((e) => $enumDecode(_$PlatformEnumEnumMap, e))
          .toList(),
    )
      ..recommendations = (json['recommendations'] as List<dynamic>)
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList()
      // ..games = (json['games'] as List<dynamic>)
      //     .map((e) => Game.fromJson(e as Map<String, dynamic>))
      //     .toList()
      ..subscriptionPlans = (json['subscriptionPlans'] as List<dynamic>)
          .map((e) => e as String)
          .toList();

Map<String, dynamic> _$GamerToJson(Gamer instance) => <String, dynamic>{
      'id': instance.id,
      'gamerName': instance.gamerName,
      'age': instance.age,
      'categories':
          instance.categories.map((e) => _$CategoryEnumEnumMap[e]).toList(),
      'platforms':
          instance.platforms.map((e) => _$PlatformEnumEnumMap[e]).toList(),
      'recommendations': instance.recommendations,
      'games': instance.games,
      'subscriptionPlans': instance.subscriptionPlans,
    };

const _$CategoryEnumEnumMap = {
  CategoryEnum.strategy: 'strategy',
  CategoryEnum.sport: 'sport',
};

const _$PlatformEnumEnumMap = {
  PlatformEnum.iOS: 'iOS',
  PlatformEnum.macOS: 'macOS',
  PlatformEnum.Android: 'Android',
  PlatformEnum.Windows: 'Windows',
  PlatformEnum.Linux: 'Linux',
  PlatformEnum.Nentendo: 'Nentendo',
  PlatformEnum.PS: 'PS',
  PlatformEnum.Xbox: 'Xbox',
};
