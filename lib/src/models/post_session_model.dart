// To parse this JSON data, do
//
//     final postSessionModel = postSessionModelFromJson(jsonString);

import 'dart:convert';

import 'package:dart_openvidu_api/src/models/media_node_model.dart';

PostSessionModel postSessionModelFromJson(String str) =>
    PostSessionModel.fromJson(json.decode(str));

String postSessionModelToJson(PostSessionModel data) =>
    json.encode(data.toJson());

class PostSessionModel {
  PostSessionModel({
    this.mediaMode,
    this.recordingMode,
    this.customSessionId,
    this.defaultOutputMode,
    this.defaultRecordingLayout,
    this.defaultCustomLayout,
    this.mediaNode,
    this.forcedVideoCodec,
    this.allowTranscoding,
  });

  ///  ROUTED (default) : Media streams will be routed through OpenVidu Server.
  ///                     This Media Mode is mandatory for session recording.
  ///  Not available yet: RELAYED
  final String mediaMode;

  ///  ALWAYS: Automatic recording from the first user publishing until the last participant leaves the session.
  ///  MANUAL (default) : If you want to manage when start and stop the recording.
  final String recordingMode;

  /// You can fix the sessionId that will be assigned to the session with this parameter.
  ///
  /// If you make another request with the exact same customSessionId while
  /// previous session already exists, no session will be created and
  /// a 409 http response will be returned.
  /// If this parameter is an empty string or not sent at all,
  /// OpenVidu Server will generate a random sessionId for you.
  /// If set, it must be an alphanumeric string: allowed numbers [0-9],
  /// letters [a-zA-Z], dashes (-) and underscores (_).
  final String customSessionId;

  /// COMPOSED(default) : when recording the session, all streams will be composed in the same file in a grid layout.
  /// INDIVIDUAL: when recording the session, every stream is recorded in its own file.
  /// COMPOSED_QUICK_START : same as COMPOSED, but the recording will start
  /// much quicker in exchange for a higher CPU usage during the lifespan
  /// of the session (see Composed quick start recording for further information).
  final String defaultOutputMode;

  /// BEST_FIT(default) : A grid layout where all the videos are evenly distributed.
  /// CUSTOM: Use your own custom layout. See Custom recording layouts section to learn how.
  /// Not available yet: PICTURE_IN_PICTURE, VERTICAL_PRESENTATION, HORIZONTAL_PRESENTATION
  final String defaultRecordingLayout;

  /// A relative path indicating the custom recording layout to be used if more than one is available.
  /// Default to empty string (if so custom layout expected under path set with
  /// openvidu-server configuration property OPENVIDU_RECORDING_CUSTOM_LAYOUT)
  final String defaultCustomLayout;

  /// PRO An object with the Media Node selector to force the Media Node allocation of this session
  /// (see Manual distribution of OpenVidu Pro sessions).
  /// Right now it may only have a single property id with a Media Node identifier.
  /// That is the id property of a Media Node object.
  final MediaNodeModel mediaNode;

  /// This parameter will ensure that all the browsers use the same codec,
  /// avoiding transcoding process in the media server, which result in a reduce of CPU usage.
  /// VP8 (default): Recommended and default value because its compatibility with browsers.
  ///                You can change this default value by setting a different value to
  ///                OPENVIDU_STREAMS_FORCED_VIDEO_CODEC in OpenVidu Configuration
  /// H264:
  /// NONE: No codec will be forced
  final String forcedVideoCodec;

  /// Defines if transcoding is allowed or not when forcedVideoCodec is not a compatible codec with the browser.
  ///
  /// If this parameter is false, not compatible browsers with codec specified in forcedVideoCodec will fail.
  /// Default value is false. You can change this default value by setting
  /// a different value to OPENVIDU_STREAMS_ALLOW_TRANSCODING in OpenVidu Configuration
  final String allowTranscoding;

  factory PostSessionModel.fromJson(Map<String, dynamic> json) =>
      PostSessionModel(
        mediaMode: json["mediaMode"],
        recordingMode: json["recordingMode"],
        customSessionId: json["customSessionId"],
        defaultOutputMode: json["defaultOutputMode"],
        defaultRecordingLayout: json["defaultRecordingLayout"],
        defaultCustomLayout: json["defaultCustomLayout"],
        mediaNode: MediaNodeModel.fromJson(json["mediaNode"]),
        forcedVideoCodec: json["forcedVideoCodec"],
        allowTranscoding: json["allowTranscoding"],
      );

  Map<String, dynamic> toJson() => {
        "mediaMode": mediaMode,
        "recordingMode": recordingMode,
        "customSessionId": customSessionId,
        "defaultOutputMode": defaultOutputMode,
        "defaultRecordingLayout": defaultRecordingLayout,
        "defaultCustomLayout": defaultCustomLayout,
        "mediaNode": mediaNode.toJson(),
        "forcedVideoCodec": forcedVideoCodec,
        "allowTranscoding": allowTranscoding,
      };
}
