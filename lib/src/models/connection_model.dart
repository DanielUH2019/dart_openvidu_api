// To parse this JSON data, do
//
//     final connection = connectionFromJson(jsonString);

import 'dart:convert';

import 'package:dart_openvidu_api/src/models/kurento_options_model.dart';
import 'package:dart_openvidu_api/src/models/publisher_model.dart';
import 'package:dart_openvidu_api/src/models/subscriber_model.dart';

ConnectionModel connectionFromJson(String str) =>
    ConnectionModel.fromJson(json.decode(str));

String connectionToJson(ConnectionModel data) => json.encode(data.toJson());

class ConnectionModel {
  ConnectionModel({
    this.id,
    this.object,
    this.type,
    this.status,
    this.sessionId,
    this.createdAt,
    this.activeAt,
    this.location,
    this.platform,
    this.token,
    this.serverData,
    this.clientData,
    this.record,
    this.role,
    this.kurentoOptions,
    this.rtspUri,
    this.adaptativeBitrate,
    this.onlyPlayWithSubscribers,
    this.networkCache,
    this.publishers,
    this.subscribers,
  });

  final String id;
  final String object;
  final String type;
  final String status;
  final String sessionId;
  final int createdAt;
  final int activeAt;
  final String location;
  final String platform;
  final String token;
  final String serverData;
  final String clientData;
  final bool record;
  final String role;
  final KurentoOptionsModel kurentoOptions;
  final bool rtspUri;
  final bool adaptativeBitrate;
  final bool onlyPlayWithSubscribers;
  final bool networkCache;
  final List<PublisherModel> publishers;
  final List<SubscriberModel> subscribers;

  factory ConnectionModel.fromJson(Map<String, dynamic> json) =>
      ConnectionModel(
        id: json["id"],
        object: json["object"],
        type: json["type"],
        status: json["status"],
        sessionId: json["sessionId"],
        createdAt: json["createdAt"],
        activeAt: json["activeAt"],
        location: json["location"],
        platform: json["platform"],
        token: json["token"],
        serverData: json["serverData"],
        clientData: json["clientData"],
        record: json["record"],
        role: json["role"],
        kurentoOptions: KurentoOptionsModel.fromJson(json["kurentoOptions"]),
        rtspUri: json["rtspUri"],
        adaptativeBitrate: json["adaptativeBitrate"],
        onlyPlayWithSubscribers: json["onlyPlayWithSubscribers"],
        networkCache: json["networkCache"],
        publishers: List<PublisherModel>.from(
            json["publishers"].map((x) => PublisherModel.fromJson(x))),
        subscribers: List<SubscriberModel>.from(
            json["subscribers"].map((x) => SubscriberModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "type": type,
        "status": status,
        "sessionId": sessionId,
        "createdAt": createdAt,
        "activeAt": activeAt,
        "location": location,
        "platform": platform,
        "token": token,
        "serverData": serverData,
        "clientData": clientData,
        "record": record,
        "role": role,
        "kurentoOptions": kurentoOptions.toJson(),
        "rtspUri": rtspUri,
        "adaptativeBitrate": adaptativeBitrate,
        "onlyPlayWithSubscribers": onlyPlayWithSubscribers,
        "networkCache": networkCache,
        "publishers": List<dynamic>.from(publishers.map((x) => x.toJson())),
        "subscribers": List<dynamic>.from(subscribers.map((x) => x.toJson())),
      };
}
