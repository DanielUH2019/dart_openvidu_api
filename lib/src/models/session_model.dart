// To parse this JSON data, do
//
//     final session = sessionFromJson(jsonString);

import 'package:dart_openvidu_api/src/models/connection_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

SessionModel sessionFromJson(String str) =>
    SessionModel.fromJson(json.decode(str));

String sessionToJson(SessionModel data) => json.encode(data.toJson());

/// A Session is a conference room where users can send/receive media streams to/from each other.
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

  /// Identifier of the session
  final String id;

  /// String representing the object’s type.
  ///
  /// Objects of the same type share the same value
  final String object;

  /// Time when the session was created in UTC milliseconds
  final int createdAt;

  /// Media mode configured for the session (ROUTED or RELAYED)
  final String mediaMode;

  /// Recording mode configured for the session (ALWAYS or MANUAL)
  final String recordingMode;

  /// The default output mode for the recordings of the session (COMPOSED or INDIVIDUAL)
  final String defaultOutputMode;

  /// The default recording layout configured for the recordings of the session.
  ///
  /// Only defined if field defaultOutputMode is set to COMPOSED
  final String defaultRecordingLayout;

  /// The default custom layout configured for the recordings of the session.
  ///
  /// Its format is a relative path. Only defined if field defaultRecordingLayout is set to CUSTOM
  final String defaultCustomLayout;

  /// Custom session identifier.
  ///
  /// Only defined if the session was initialized
  /// passing a customSessionId field in method POST /openvidu/api/sessions
  final String customSessionId;

  /// Collection of active connections in the session.
  ///
  /// This object is defined by a numberOfElements property
  /// counting the total number of active connections and a
  /// content array with the actual active connections.
  /// Active connections are those with status property set to active.
  /// See [ConnectionModel] object
  final ConnectionsModel connections;

  /// Whether the session is being recorded or not at this moment
  final bool recording;

  /// This parameter will ensure that all the browsers use the same codec,
  ///
  /// avoiding transcoding process in the media server,
  /// which result in a reduce of CPU usage. (VP8, H264 or NONE)
  final String forcedVideoCodec;

  /// Defines if transcoding is allowed or not when forcedVideoCodec is not a compatible codec with the browser.
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
