import 'package:dart_openvidu_api/src/models/recording_model.dart';
import 'package:meta/meta.dart';

class RecordingsModel {
  RecordingsModel({
    @required this.count,
    @required this.items,
  });

  final int count;
  final List<RecordingModel> items;

  factory RecordingsModel.fromJson(Map<String, dynamic> json) =>
      RecordingsModel(
        count: json["numberOfElements"],
        items: List<RecordingModel>.from(
            json["content"].map((x) => RecordingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "numberOfElements": count,
        "content": List<RecordingModel>.from(items.map((x) => x.toJson())),
      };
}
