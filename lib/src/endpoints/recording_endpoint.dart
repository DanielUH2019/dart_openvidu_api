import 'package:dart_openvidu_api/src/models/models.dart';
import 'package:dio/dio.dart';

class RecordingEndpoint {
  final Dio _dio;
  final String path = "/openvidu/api/recordings";

  RecordingEndpoint(this._dio);

  /// Start the recording of a Session.
  ///
  /// METHOD	POST
  /// URL	https://YOUR_OPENVIDUSERVER_IP/openvidu/api/recordings/start
  /// HEADERS	Authorization: Basic EncodeBase64(OPENVIDUAPP:<YOUR_SECRET>)
  /// Content-Type: application/json
  Future<RecordingModel> startRecording(RecordingModel recordingModel) async {
    var response =
        await _dio.post(path + "/start", data: recordingModel.toJson());

    if (response.statusCode != 200) throw Exception(response.statusMessage);
    print(response.statusMessage);
    return RecordingModel.fromJson(response.data);
  }

  /// Stop the recording of a Session.
  ///
  /// METHOD	POST
  /// URL	https://YOUR_OPENVIDUSERVER_IP/openvidu/api/recordings/stop/RECORDING_ID
  /// HEADERS	Authorization: Basic EncodeBase64(OPENVIDUAPP:<YOUR_SECRET>)
  Future<RecordingModel> stopRecording(String recordingId) async {
    var response = await _dio.post(path + "/stop/$recordingId");
    if (response.statusCode != 200) throw Exception(response.statusMessage);
    print(response.statusMessage);
    return RecordingModel.fromJson(response.data);
  }

  /// Retrieve a Recording from OpenVidu Server.
  ///
  /// METHOD	GET
  /// URL	https://YOUR_OPENVIDUSERVER_IP/openvidu/api/recordings/RECORDING_ID
  /// HEADERS	Authorization: Basic EncodeBase64(OPENVIDUAPP:<YOUR_SECRET>)
  Future<RecordingModel> getRecording(String recordingId) async {
    var response = await _dio.get(path + "/$recordingId");
    if (response.statusCode != 200) throw Exception(response.statusMessage);
    print(response.statusMessage);
    return RecordingModel.fromJson(response.data);
  }

  /// Retrieve all Recordings from OpenVidu Server.
  ///
  /// METHOD	GET
  /// URL	https://YOUR_OPENVIDUSERVER_IP/openvidu/api/recordings
  /// HEADERS	Authorization: Basic EncodeBase64(OPENVIDUAPP:<YOUR_SECRET>)
  Future<RecordingsModel> getAllRecordings() async {
    var response = await _dio.get(path);
    if (response.statusCode != 200) throw Exception(response.statusMessage);
    print(response.statusMessage);
    return RecordingsModel.fromJson(response.data);
  }

  /// Delete a Recording.
  ///
  /// This will delete all of the recording files from disk
  /// METHOD	DELETE
  /// URL	https://YOUR_OPENVIDUSERVER_IP/openvidu/api/recordings/RECORDING_ID
  /// HEADERS	Authorization: Basic EncodeBase64(OPENVIDUAPP:<YOUR_SECRET>)
  Future<void> deleteRecording(String recordingId) async {
    var response = await _dio.delete(path + "$recordingId");
    if (response.statusCode != 200) throw Exception(response.statusMessage);
    print(response.statusMessage);
  }
}
