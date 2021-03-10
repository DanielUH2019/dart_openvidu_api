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

/// A Connection represents each one of the users connected to a Session.
///
/// You must create a Connection for each final user connecting to the Session.
/// After creating the Connection, its status property will be set to pending.
/// This means that the Connection is currently available to be taken by a final user.
/// Pass the token attribute of a Connection object to the client-side,
/// and use it to call method Session.connect of OpenVidu Browser library.
/// After this, the Connection object will be associated to this final user and
/// its status property will be set to active.
/// Other properties will also be now populated with the data of the final user.
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

  /// Identifier of the Connection
  final String id;

  /// String representing the object’s type.
  ///
  /// Objects of the same type share the same value
  final String object;

  /// Type of the Connection.
  ///
  /// It can be WEBRTC for a regular user connecting from an application or
  /// IPCAM for an IP camera
  final String type;

  /// Status of the Connection:
  ///   pending: the Connection is waiting for any user to use
  ///            its internal token to connect to the Session,
  ///            calling method Session.connect OpenVidu Browser.
  ///   active: the internal token of the Connection has already been used
  ///           by some user to connect to the Session,
  ///           and it cannot be used again.
  final String status;

  /// Identifier of the Session to which the user is connected
  final String sessionId;

  /// Time when the Connection was created in UTC milliseconds
  final int createdAt;

  /// Time when the Connection was taken by a user
  /// by calling method Session.connect with the Connection's token property, in UTC milliseconds.
  ///
  /// This is the time when the Connection status passed from pending to active
  final int activeAt;

  /// Geographic location of the participant PRO
  final String location;

  /// Complete description of the platform used by the participant to connect to the Session.
  ///
  /// Set to IPCAM if type=IPCAM
  final String platform;

  /// Token of the Connection.
  ///
  /// Pass it to the client-side to be used in method Session.connect.
  /// Set to null if type=IPCAM
  final String token;

  /// Data assigned to the Connection in your application's server-side when creating the Connection (data parameter)
  final String serverData;

  /// Data assigned to the Connection in your application's client-side
  /// when calling Session.connect (metadata parameter).
  ///
  /// Set to null if type=IPCAM or status=pending
  final String clientData;

  /// Whether the streams published by this Connections will be recorded or not.
  ///
  /// This only affects INDIVIDUAL recording PRO
  final bool record;

  /// Only for type=WEBRTC. Role of the Connection
  final String role;

  /// Only for type=WEBRTC.
  ///
  /// Configuration properties applied to the streams of this Connection, regarding Kurento
  final KurentoOptionsModel kurentoOptions;

  /// Only for type=IPCAM. RTSP URI of the IP camera
  final String rtspUri;

  /// Only for type=IPCAM.
  ///
  /// Whether to use adaptative bitrate (and therefore adaptative quality) or not
  final bool adaptativeBitrate;

  /// Only for type=IPCAM.
  ///
  /// Whether to enable the IP camera stream only when some user is subscribed to it, or not
  final bool onlyPlayWithSubscribers;

  /// Only for type=IPCAM.
  ///
  /// Size of the buffer of the endpoint receiving the IP camera's stream, in milliseconds
  final int networkCache;

  /// Collection of Publisher objects:
  ///   streams the Connection is currently publishing.
  ///   Each one has the following properties:
  ///     streamId (String) : identifier of the stream
  ///     createdAt (Number) : time when the stream was published in UTC milliseconds
  ///     mediaOptions (Object) : current properties of the published stream.
  ///                             See Stream object from openvidu-browser library for a description of them. Some may change dynamically.
  final List<PublisherModel> publishers;

  /// Collection of Subscriber objects: streams the user is currently subscribed to.
  ///
  /// Each one has the following properties:
  ///   streamId (String) : equal to the streamId property of its associated publisher,
  ///                       that must be present in the publishers array of some other connection of the Session
  ///   createdAt (Number) : time when the subscription was established in UTC milliseconds
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
