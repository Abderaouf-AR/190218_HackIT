import 'package:json_annotation/json_annotation.dart';

part 'recommendation.g.dart';

@JsonSerializable()

class Recommendation{
  String id;
  DateTime recoDate;
  String terraRequestId;
  String gameOneId;
  String gameTwoId;
  String gameThreeId;
  int choice = 4;

  Recommendation(
      {required this.id,
        required this.recoDate,
        required this.terraRequestId,
        required this.gameOneId,
        required this.gameTwoId,
        required this.gameThreeId});

  factory Recommendation.fromJson(Map<String, dynamic> json) => _$RecommendationFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationToJson(this);
}