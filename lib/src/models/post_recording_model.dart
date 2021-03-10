// To parse this JSON data, do
//
//     final postRecordingModel = postRecordingModelFromJson(jsonString);

import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:dart_openvidu_api/src/models/media_node_model.dart';

PostRecordingModel postRecordingModelFromJson(String str) =>
    PostRecordingModel.fromJson(json.decode(str));

String postRecordingModelToJson(PostRecordingModel data) =>
    json.encode(data.toJson());

class PostRecordingModel {
  PostRecordingModel({
    @required this.session,
    this.name,
    this.outputMode,
    this.hasAudio,
    this.hasVideo,
    this.recordingLayout,
    this.customLayout,
    this.resolution,
    this.mediaNode,
  });

  /// The sessionId belonging to the session you want to start recording.
  final String session;

  /// the name you want to give to the video file.
  ///
  /// You can access this same property in openvidu-browser on recordingEvents.
  /// If no name is provided, the video file will be named after id property of the recording.
  final String name;

  /// record all streams in a single file in a grid layout or record each stream in its own separate file.
  ///
  /// This property will override the defaultOutputMode property set on POST /openvidu/api/sessions for this particular recording.
  /// COMPOSED(default) : when recording the session, all streams will be composed in the same file in a grid layout.
  /// INDIVIDUAL: when recording the session, every stream is recorded in its own file.
  final String outputMode;

  /// whether to record audio or not. Default to true
  final bool hasAudio;

  /// whether to record video or not. Default to true
  final bool hasVideo;

  /// Only applies if outputMode is set to COMPOSED and hasVideo to true) :
  ///   the layout to be used in this recording.
  ///
  /// This property will override the defaultRecordingLayout property set on POST /openvidu/api/sessions for this particular recording.
  /// BEST_FIT(default) : A grid layout where all the videos are evenly distributed.
  /// CUSTOM: Use your own custom layout. See Custom recording layouts section to learn how.
  /// Not available yet: PICTURE_IN_PICTURE, VERTICAL_PRESENTATION, HORIZONTAL_PRESENTATION
  final String recordingLayout;

  /// Only applies if recordingLayout is set to CUSTOM) :
  ///   a relative path indicating the custom recording layout to be used if more than one is available.
  ///
  /// Default to empty string (if so custom layout expected under path set with
  /// openvidu-server configuration property OPENVIDU_RECORDING_CUSTOM_LAYOUT).
  /// This property will override the defaultCustomLayout property set on POST /openvidu/api/sessions for this particular recording.
  final String customLayout;

  /// Only applies if outputMode is set to COMPOSED and hasVideo to true) :
  ///   the resolution of the recorded video file.
  ///
  /// It is a string indicating the width and height in pixels like this: "1920x1080".
  /// Values for both width and height must be between 100 and 1999.
  final String resolution;

  /// PRO
  /// An object with the Media Node selector to force the Media Node allocation of this recording.
  ///
  /// Only for composed recordings with video (see Scalable composed recording).
  /// Right now it may only have a single property id with a Media Node identifier.
  /// That is the id property of a Media Node object.
  final MediaNodeModel mediaNode;

  factory PostRecordingModel.fromJson(Map<String, dynamic> json) =>
      PostRecordingModel(
        session: json["session"],
        name: json["name"],
        outputMode: json["outputMode"],
        hasAudio: json["hasAudio"],
        hasVideo: json["hasVideo"],
        recordingLayout: json["recordingLayout"],
        customLayout: json["customLayout"],
        resolution: json["resolution"],
        mediaNode: MediaNodeModel.fromJson(json["mediaNode"]),
      );

  Map<String, dynamic> toJson() => {
        "session": session,
        "name": name,
        "outputMode": outputMode,
        "hasAudio": hasAudio,
        "hasVideo": hasVideo,
        "recordingLayout": recordingLayout,
        "customLayout": customLayout,
        "resolution": resolution,
        "mediaNode": mediaNode.toJson(),
      };
}
