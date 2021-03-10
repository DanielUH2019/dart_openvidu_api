import 'package:dart_openvidu_api/src/models/media_options_model.dart';

class PublisherModel {
  PublisherModel({
    this.createdAt,
    this.streamId,
    this.mediaOptions,
  });

  final int createdAt;
  final String streamId;
  final MediaOptionsModel mediaOptions;

  factory PublisherModel.fromJson(Map<String, dynamic> json) => PublisherModel(
        createdAt: json["createdAt"],
        streamId: json["streamId"],
        mediaOptions: MediaOptionsModel.fromJson(json["mediaOptions"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "streamId": streamId,
        "mediaOptions": mediaOptions.toJson(),
      };
}
