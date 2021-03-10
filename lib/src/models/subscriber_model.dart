class SubscriberModel {
  SubscriberModel({
    this.streamId,
    this.createdAt,
  });

  final String streamId;
  final int createdAt;

  factory SubscriberModel.fromJson(Map<String, dynamic> json) =>
      SubscriberModel(
        streamId: json["streamId"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "streamId": streamId,
        "createdAt": createdAt,
      };
}
