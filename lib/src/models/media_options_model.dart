import 'package:dart_openvidu_api/src/models/filter_model.dart';

class MediaOptionsModel {
  MediaOptionsModel({
    this.hasAudio,
    this.audioActive,
    this.hasVideo,
    this.videoActive,
    this.typeOfVideo,
    this.frameRate,
    this.videoDimensions,
    this.filter,
  });

  final bool hasAudio;
  final bool audioActive;
  final bool hasVideo;
  final bool videoActive;
  final String typeOfVideo;
  final int frameRate;
  final String videoDimensions;
  final FilterModel filter;

  factory MediaOptionsModel.fromJson(Map<String, dynamic> json) =>
      MediaOptionsModel(
        hasAudio: json["hasAudio"],
        audioActive: json["audioActive"],
        hasVideo: json["hasVideo"],
        videoActive: json["videoActive"],
        typeOfVideo: json["typeOfVideo"],
        frameRate: json["frameRate"],
        videoDimensions: json["videoDimensions"],
        filter: FilterModel.fromJson(json["filter"]),
      );

  Map<String, dynamic> toJson() => {
        "hasAudio": hasAudio,
        "audioActive": audioActive,
        "hasVideo": hasVideo,
        "videoActive": videoActive,
        "typeOfVideo": typeOfVideo,
        "frameRate": frameRate,
        "videoDimensions": videoDimensions,
        "filter": filter.toJson(),
      };
}
