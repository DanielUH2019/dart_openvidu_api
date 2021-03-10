class MediaNodeModel {
  MediaNodeModel({
    this.id,
  });

  final String id;

  factory MediaNodeModel.fromJson(Map<String, dynamic> json) => MediaNodeModel(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
