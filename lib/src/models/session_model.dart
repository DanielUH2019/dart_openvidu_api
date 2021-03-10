// To parse this JSON data, do
//
//     final session = sessionFromJson(jsonString);

import 'package:dart_openvidu_api/src/models/connection_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

SessionModel sessionFromJson(String str) =>
    SessionModel.fromJson(json.decode(str));

String sessionToJson(SessionModel data) => json.encode(data.toJson());

class SessionModel {
  SessionModel({
    @required this.id,
    @required this.object,
    @required this.createdAt,
    @required this.mediaMode,
    @required this.recordingMode,
    @required this.defaultOutputMode,
    @required this.defaultRecordingLayout,
    @required this.defaultCustomLayout,
    @required this.customSessionId,
    @required this.connections,
    @required this.recording,
    @required this.forcedVideoCodec,
    @required this.allowTranscoding,
  });

  final String id;
  final String object;
  final int createdAt;
  final String mediaMode;
  final String recordingMode;
  final String defaultOutputMode;
  final String defaultRecordingLayout;
  final String defaultCustomLayout;
  final String customSessionId;
  final ConnectionsModel connections;
  final bool recording;
  final String forcedVideoCodec;
  final bool allowTranscoding;

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
        id: json["id"],
        object: json["object"],
        createdAt: json["createdAt"],
        mediaMode: json["mediaMode"],
        recordingMode: json["recordingMode"],
        defaultOutputMode: json["defaultOutputMode"],
        defaultRecordingLayout: json["defaultRecordingLayout"],
        defaultCustomLayout: json["defaultCustomLayout"],
        customSessionId: json["customSessionId"],
        connections: ConnectionsModel.fromJson(json["connections"]),
        recording: json["recording"],
        forcedVideoCodec: json["forcedVideoCodec"],
        allowTranscoding: json["allowTranscoding"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "createdAt": createdAt,
        "mediaMode": mediaMode,
        "recordingMode": recordingMode,
        "defaultOutputMode": defaultOutputMode,
        "defaultRecordingLayout": defaultRecordingLayout,
        "defaultCustomLayout": defaultCustomLayout,
        "customSessionId": customSessionId,
        "connections": connections.toJson(),
        "recording": recording,
        "forcedVideoCodec": forcedVideoCodec,
        "allowTranscoding": allowTranscoding,
      };
}

class ConnectionsModel {
  ConnectionsModel({
    @required this.numberOfElements,
    @required this.content,
  });

  final int numberOfElements;
  final List<ConnectionModel> content;

  factory ConnectionsModel.fromJson(Map<String, dynamic> json) =>
      ConnectionsModel(
        numberOfElements: json["numberOfElements"],
        content: List<ConnectionModel>.from(
            json["content"].map((x) => ConnectionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "numberOfElements": numberOfElements,
        "content": List<ConnectionModel>.from(content.map((x) => x.toJson())),
      };
}
