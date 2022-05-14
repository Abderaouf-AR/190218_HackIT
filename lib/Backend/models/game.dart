import 'package:json_annotation/json_annotation.dart';

// part 'game.g.dart';

@JsonSerializable()

class Game{
  String id;
  String gameName;
  int minAge;
  String platform;
  List<String> category;

  Game({required this.id,required  this.gameName,required  this.minAge,required  this.platform, required this.category});

  // factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$GameToJson(this);

}