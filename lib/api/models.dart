// To parse this JSON data, do
//
//     final measurementData = measurementDataFromJson(jsonString);

import 'dart:convert';

MeasurementData measurementDataFromJson(String str) =>
    MeasurementData.fromJson(json.decode(str));

String measurementDataToJson(MeasurementData data) =>
    json.encode(data.toJson());

class MeasurementData {
  MeasurementData({
    required this.status,
    required this.d,
  });

  int status;
  D d;

  factory MeasurementData.fromJson(Map<String, dynamic> json) =>
      MeasurementData(
        status: json["status"],
        d: D.fromJson(json["d"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "d": d.toJson(),
      };
}

class D {
  D({
    required this.measurementId,
    required this.neck,
    required this.height,
    required this.weight,
    required this.belly,
    required this.chest,
    required this.wrist,
    required this.armLength,
    required this.thigh,
    required this.shoulder,
    required this.hips,
    required this.ankle,
  });

  String measurementId;
  String neck;
  String height;
  String weight;
  String belly;
  String chest;
  String wrist;
  String armLength;
  String thigh;
  String shoulder;
  String hips;
  String ankle;

  factory D.fromJson(Map<String, dynamic> json) => D(
        measurementId: json["measurementId"],
        neck: json["neck"],
        height: json["height"],
        weight: json["weight"],
        belly: json["belly"],
        chest: json["chest"],
        wrist: json["wrist"],
        armLength: json["armLength"],
        thigh: json["thigh"],
        shoulder: json["shoulder"],
        hips: json["hips"],
        ankle: json["ankle"],
      );

  Map<String, dynamic> toJson() => {
        "measurementId": measurementId,
        "neck": neck,
        "height": height,
        "weight": weight,
        "belly": belly,
        "chest": chest,
        "wrist": wrist,
        "armLength": armLength,
        "thigh": thigh,
        "shoulder": shoulder,
        "hips": hips,
        "ankle": ankle,
      };
}
