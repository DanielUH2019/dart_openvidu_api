// To parse this JSON data, do
//
//     final recording = recordingFromJson(jsonString);

import 'dart:convert';

RecordingModel recordingFromJson(String str) =>
    RecordingModel.fromJson(json.decode(str));

String recordingToJson(RecordingModel data) => json.encode(data.toJson());

/// A Recording represents the recording process of a Session.
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

  /// Identifier of the Recording.
  ///
  /// It will be based on the identifier of the session.
  /// Store it to perform other operations such as stop, get or delete the Recording
  final String id;

  /// String representing the object’s type.
  ///
  /// Objects of the same type share the same value
  final String object;

  /// Name of the Recording.
  ///
  /// If no name parameter is provided, will be equal to id field
  final String name;

  /// Output mode of the Recording
  final String outputMode;

  /// True if the Recording includes an audio track, false otherwise
  final bool hasAudio;

  /// True if the Recording includes a video track, false otherwise
  final bool hasVideo;

  /// Resolution of the video file.
  ///
  /// Only defined if outputMode is set to COMPOSED and hasVideo to true
  final String resolution;

  /// The recording layout that is being used.
  ///
  /// Only defined if outputMode is set to COMPOSED and hasVideo to true
  final String recordingLayout;

  /// The custom layout that is being used.
  ///
  /// Only defined if recordingLayout is set to CUSTOM
  final String customLayout;

  /// Session associated to the Recording
  final String sessionId;

  /// Time when the Recording started in UTC milliseconds
  final int createdAt;

  /// Size in bytes of the video file.
  ///
  /// Only guaranteed to be greater than 0 if status is ready
  final int size;

  /// Duration of the video file in seconds.
  ///
  /// Only guaranteed to be greater than 0 if status is ready
  final double duration;

  /// URL where the Recording file is available.
  ///
  /// Only guaranteed to different than null if status is ready.
  /// The final URL value follows this format:
  /// https://YOUR_OPENVIDUSERVER_IP/openvidu/recordings/<RECORDING_ID>/<RECORDING_NAME>.<EXTENSION>
  /// This path will be protected with OpenVidu credentials depending on
  /// whether openvidu-server configuration property OPENVIDU_RECORDING_PUBLIC_ACCESS is false or true.
  /// This format is equals to the AWS S3 URL object property of the uploaded object
  /// for OpenVidu Pro deployments configured to upload recordings to S3
  final String url;

  /// Status of the Recording:
  ///
  ///   starting: the Recording is being started. This is in a way a special status,
  ///             because it can only appear if a concurrent REST API call to
  ///             list recordings is done at the narrow time frame in which the Recording starts.
  ///             The moment the start operation returns, the Recording status will be started.
  ///             A Recording in this status cannot be stopped.
  ///             It does not get triggered in CDR/Webhook recordingStatusChanged.
  ///
  ///   started: the session is being recorded.
  ///            This means the associated video(s) already exists and its size is greater than 0.
  ///            NOTE: when using COMPOSED recording with video, this event does not mean there
  ///                  are publisher's streams being actually recorded in the video file.
  ///                  It only ensures the video file exists and its size is greater than 0.
  ///
  ///   stopped: the recording process has stopped and files are being processed.
  ///            Depending on the type of OpenVidu deployment and configuration,
  ///            properties duration and size can be set to 0 and url can be null.
  ///
  ///            If this is the case, wait for status ready to get the final value of these properties.
  ///   ready: the recorded file has been successfully processed and is available for download.
  ///          Properties duration, size and url will always be properly defined at this moment.
  ///          For OpenVidu Pro deployments configured to upload recordings to S3 this status means that
  ///          the Recording has been successfully stored in the S3 bucket.
  ///
  ///   failed: the recording process has failed.
  ///           The final state of the recorded file cannot be guaranteed to be stable.
  ///
  /// The recording status will be started after calling the start operation and while the Recording is active.
  /// After calling stop operation, the status may be stopped or ready depending on the type of deployment of OpenVidu.
  /// OpenVidu CE will always return ready status.
  /// OpenVidu Pro will always return stopped status and properties size,
  /// duration and url will not have their final value defined yet.
  /// Listen to recordingStatusChanged CDR/Webhook event to know when the Recording has reached ready status in this case
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
