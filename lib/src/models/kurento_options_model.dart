class KurentoOptionsModel {
  KurentoOptionsModel({
    this.videoMaxRecvBandwidth,
    this.videoMinRecvBandwidth,
    this.videoMaxSendBandwidth,
    this.videoMinSendBandwidth,
    this.allowedFilters,
  });

  final int videoMaxRecvBandwidth;
  final int videoMinRecvBandwidth;
  final int videoMaxSendBandwidth;
  final int videoMinSendBandwidth;
  final List<String> allowedFilters;

  factory KurentoOptionsModel.fromJson(Map<String, dynamic> json) =>
      KurentoOptionsModel(
        videoMaxRecvBandwidth: json["videoMaxRecvBandwidth"],
        videoMinRecvBandwidth: json["videoMinRecvBandwidth"],
        videoMaxSendBandwidth: json["videoMaxSendBandwidth"],
        videoMinSendBandwidth: json["videoMinSendBandwidth"],
        allowedFilters: List<String>.from(json["allowedFilters"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "videoMaxRecvBandwidth": videoMaxRecvBandwidth,
        "videoMinRecvBandwidth": videoMinRecvBandwidth,
        "videoMaxSendBandwidth": videoMaxSendBandwidth,
        "videoMinSendBandwidth": videoMinSendBandwidth,
        "allowedFilters": List<dynamic>.from(allowedFilters.map((x) => x)),
      };
}
