// To parse this JSON data, do
//
//     final trialModel = trialModelFromJson(jsonString);

import 'dart:convert';

TrialModel trialModelFromJson(String str) => TrialModel.fromJson(json.decode(str));

String trialModelToJson(TrialModel data) => json.encode(data.toJson());

class TrialModel {
  TrialModel({
    this.typeId,
    this.country,
    this.sortName,
    this.area,
    this.disambiguation,
    this.gender,
    this.beginArea,
    this.ipis,
    this.trialModelEndArea,
    this.type,
    this.genderId,
    this.isnis,
    this.name,
    this.lifeSpan,
    this.endArea,
    this.trialModelBeginArea,
    this.id,
  });

  String? typeId;
  String? country;
  String? sortName;
  Area? area;
  String? disambiguation;
  dynamic gender;
  Area? beginArea;
  List<dynamic>? ipis;
  dynamic trialModelEndArea;
  String? type;
  dynamic genderId;
  List<String>? isnis;
  String? name;
  LifeSpan? lifeSpan;
  dynamic endArea;
  Area? trialModelBeginArea;
  String? id;

  factory TrialModel.fromJson(Map<String, dynamic> json) => TrialModel(
    typeId: json["type-id"],
    country: json["country"],
    sortName: json["sort-name"],
    area: Area.fromJson(json["area"]),
    disambiguation: json["disambiguation"],
    gender: json["gender"],
    beginArea: Area.fromJson(json["begin-area"]),
    ipis: List<dynamic>.from(json["ipis"].map((x) => x)),
    trialModelEndArea: json["end_area"],
    type: json["type"],
    genderId: json["gender-id"],
    isnis: List<String>.from(json["isnis"].map((x) => x)),
    name: json["name"],
    lifeSpan: LifeSpan.fromJson(json["life-span"]),
    endArea: json["end-area"],
    trialModelBeginArea: Area.fromJson(json["begin_area"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "type-id": typeId,
    "country": country,
    "sort-name": sortName,
    "area": area!.toJson(),
    "disambiguation": disambiguation,
    "gender": gender,
    "begin-area": beginArea!.toJson(),
    "ipis": List<dynamic>.from(ipis!.map((x) => x)),
    "end_area": trialModelEndArea,
    "type": type,
    "gender-id": genderId,
    "isnis": List<dynamic>.from(isnis!.map((x) => x)),
    "name": name,
    "life-span": lifeSpan!.toJson(),
    "end-area": endArea,
    "begin_area": trialModelBeginArea!.toJson(),
    "id": id,
  };
}

class Area {
  Area({
    this.typeId,
    this.type,
    this.iso31661Codes,
    this.name,
    this.sortName,
    this.disambiguation,
    this.id,
  });

  dynamic typeId;
  dynamic type;
  List<String>? iso31661Codes;
  String? name;
  String? sortName;
  String? disambiguation;
  String? id;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    typeId: json["type-id"],
    type: json["type"],
    iso31661Codes: json["iso-3166-1-codes"] == null ? null : List<String>.from(json["iso-3166-1-codes"].map((x) => x)),
    name: json["name"],
    sortName: json["sort-name"],
    disambiguation: json["disambiguation"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "type-id": typeId,
    "type": type,
    "iso-3166-1-codes": iso31661Codes == null ? null : List<dynamic>.from(iso31661Codes!.map((x) => x)),
    "name": name,
    "sort-name": sortName,
    "disambiguation": disambiguation,
    "id": id,
  };
}

class LifeSpan {
  LifeSpan({
    this.ended,
    this.begin,
    this.end,
  });

  bool? ended;
  String? begin;
  DateTime ?end;

  factory LifeSpan.fromJson(Map<String, dynamic> json) => LifeSpan(
    ended: json["ended"],
    begin: json["begin"],
    end: DateTime.parse(json["end"]),
  );

  Map<String, dynamic> toJson() => {
    "ended": ended,
    "begin": begin,
    "end": "${end!.year.toString().padLeft(4, '0')}-${end!.month.toString().padLeft(2, '0')}-${end!.day.toString().padLeft(2, '0')}",
  };
}
