// To parse this JSON data, do
//
//     final recording = recordingFromJson(jsonString);

import 'dart:convert';

RecordingModel recordingFromJson(String str) =>
    RecordingModel.fromJson(json.decode(str));

String recordingToJson(RecordingModel data) => json.encode(data.toJson());

class RecordingModel {
  RecordingModel({
    this.id,
    this.object,
    this.name,
    this.outputMode,
    this.hasAudio,
    this.hasVideo,
    this.resolution,
    this.recordingLayout,
    this.customLayout,
    this.sessionId,
    this.createdAt,
    this.size,
    this.duration,
    this.url,
    this.status,
  });

  final String id;
  final String object;
  final String name;
  final String outputMode;
  final bool hasAudio;
  final bool hasVideo;
  final String resolution;
  final String recordingLayout;
  final String customLayout;
  final String sessionId;
  final int createdAt;
  final int size;
  final double duration;
  final String url;
  final String status;

  factory RecordingModel.fromJson(Map<String, dynamic> json) => RecordingModel(
        id: json["id"],
        object: json["object"],
        name: json["name"],
        outputMode: json["outputMode"],
        hasAudio: json["hasAudio"],
        hasVideo: json["hasVideo"],
        resolution: json["resolution"],
        recordingLayout: json["recordingLayout"],
        customLayout: json["customLayout"],
        sessionId: json["sessionId"],
        createdAt: json["createdAt"],
        size: json["size"],
        duration: json["duration"].toDouble(),
        url: json["url"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "name": name,
        "outputMode": outputMode,
        "hasAudio": hasAudio,
        "hasVideo": hasVideo,
        "resolution": resolution,
        "recordingLayout": recordingLayout,
        "customLayout": customLayout,
        "sessionId": sessionId,
        "createdAt": createdAt,
        "size": size,
        "duration": duration,
        "url": url,
        "status": status,
      };
}
