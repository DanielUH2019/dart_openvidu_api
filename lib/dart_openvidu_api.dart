library dart_openvidu_api;

export 'package:dart_openvidu_api/src/endpoints/endpoints.dart';
export 'package:dart_openvidu_api/src/models/models.dart';

import 'dart:convert';
import 'package:dart_openvidu_api/src/endpoints/endpoints.dart';
import 'package:dio/dio.dart';

class OpenViduApi {
  final String baseUrl;
  final String openViduSecret;
  Dio _dio;
  SessionEndpoint _sessionEndpoint;
  RecordingEndpoint _recordingEndpoint;
  ConnectionEndpoint _connectionEndpoint;

  OpenViduApi({this.baseUrl, this.openViduSecret}) {
    var bytes = utf8.encode("OPENVIDUAPP:$openViduSecret");
    var openViduSecretEncoded = base64.encode(bytes);
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        headers: {"Authorization": "Basic $openViduSecretEncoded"});

    _dio = Dio(options);

    _sessionEndpoint = SessionEndpoint(_dio);
    _recordingEndpoint = RecordingEndpoint(_dio);
    _connectionEndpoint = ConnectionEndpoint(_dio);
  }

  SessionEndpoint get sessionEndpoint => _sessionEndpoint;

  RecordingEndpoint get recordingEndpoint => _recordingEndpoint;

  ConnectionEndpoint get connectionEndpoint => _connectionEndpoint;
}
