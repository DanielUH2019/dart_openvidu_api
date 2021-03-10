import 'package:dart_openvidu_api/src/models/models.dart';
import 'package:dio/dio.dart';

class SessionEndpoint {
  final Dio _dio;
  final path = "/openvidu/api/sessions";

  SessionEndpoint(this._dio);

  /// Initialize a Session in OpenVidu Server.
  ///
  /// This is the very first operation to perform in OpenVidu workflow.
  /// After that, Connection objects can be generated for this Session and their
  /// token passed to the client-side, so clients can use it to connect to the Session.
  /// METHOD	POST
  /// URL	https://YOUR_OPENVIDUSERVER_IP/openvidu/api/sessions
  /// HEADERS	Authorization: Basic EncodeBase64(OPENVIDUAPP:<YOUR_SECRET>) Content-Type: application/json
  Future<SessionModel> initializeSession(PostSessionModel sessionModel) async {
    var response = await _dio.post(path, data: sessionModel.toJson());

    if (response.statusCode != 200) throw Exception(response.statusMessage);
    print(response.statusMessage);
    return SessionModel.fromJson(response.data);
  }

  /// Retrieve a Session from OpenVidu Server.
  ///
  /// METHOD	GET
  /// URL	https://YOUR_OPENVIDUSERVER_IP/openvidu/api/sessions/SESSION_ID
  /// HEADERS	Authorization: Basic EncodeBase64(OPENVIDUAPP:<YOUR_SECRET>)
  Future<SessionModel> getSession(String sessionId) async {
    var response = await _dio.get(path + "/$sessionId");
    if (response.statusCode != 200) throw Exception(response.statusMessage);
    print(response.statusMessage);
    return SessionModel.fromJson(response.data);
  }

  /// Retrieve all Sessions from OpenVidu Server
  ///
  /// METHOD  GET
  /// URL	https://YOUR_OPENVIDUSERVER_IP/openvidu/api/sessions
  /// HEADERS	Authorization: Basic EncodeBase64(OPENVIDUAPP:<YOUR_SECRET>)
  Future<ConnectionsModel> getAllSessions() async {
    var response = await _dio.get(path);
    if (response.statusCode != 200) throw Exception(response.statusMessage);
    print(response.statusMessage);
    return ConnectionsModel.fromJson(response.data);
  }

  /// Close a Session.
  ///
  /// This will stop all of the processes of this Session:
  ///   all of its Connections, Streams and Recordings will be closed.
  /// METHOD	DELETE
  /// URL	https://YOUR_OPENVIDUSERVER_IP/openvidu/api/sessions/SESSION_ID
  /// HEADERS	Authorization: Basic EncodeBase64(OPENVIDUAPP:<YOUR_SECRET>)
  void closeSession(String sessionId) async {
    var response = await _dio.delete(path);
    if (response.statusCode != 200) throw Exception(response.statusMessage);
    print(response.statusMessage);
    print(response.statusMessage);
  }
}
