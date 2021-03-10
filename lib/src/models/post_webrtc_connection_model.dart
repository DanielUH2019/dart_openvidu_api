// To parse this JSON data, do
//
//     final postWebrtcConnectionModel = postWebrtcConnectionModelFromJson(jsonString);

import 'dart:convert';

import 'package:dart_openvidu_api/src/models/kurento_options_model.dart';

PostWebrtcConnectionModel postWebrtcConnectionModelFromJson(String str) =>
    PostWebrtcConnectionModel.fromJson(json.decode(str));

String postWebrtcConnectionModelToJson(PostWebrtcConnectionModel data) =>
    json.encode(data.toJson());

class PostWebrtcConnectionModel {
  PostWebrtcConnectionModel({
    this.type,
    this.data,
    this.record,
    this.role,
    this.kurentoOptions,
  });

  final String type;
  final String data;
  final bool record;
  final String role;
  final KurentoOptionsModel kurentoOptions;

  factory PostWebrtcConnectionModel.fromJson(Map<String, dynamic> json) =>
      PostWebrtcConnectionModel(
        type: json["type"],
        data: json["data"],
        record: json["record"],
        role: json["role"],
        kurentoOptions: KurentoOptionsModel.fromJson(json["kurentoOptions"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "data": data,
        "record": record,
        "role": role,
        "kurentoOptions": kurentoOptions.toJson(),
      };
}
