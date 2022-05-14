import 'package:json_annotation/json_annotation.dart';
import 'package:next_game/Backend/models/recommendation.dart';

import '../myEnums.dart';
import 'Game.dart';

part 'gamer.g.dart';

@JsonSerializable()

class Gamer{
  String id;
  String gamerName;
  int age;
  List<CategoryEnum> categories;
  List<PlatformEnum> platforms;
  List<Recommendation> recommendations = [];
  List<Game> games = [];
  List<String> subscriptionPlans = [];


  Gamer({required this.id,required  this.gamerName,required  this.age,required  this.categories,required  this.platforms});

  factory Gamer.fromJson(Map<String, dynamic> json) => _$GamerFromJson(json);

  Map<String, dynamic> toJson() => _$GamerToJson(this);

}