import 'dart:async';

import 'package:dart_openvidu_api/src/models/connection_model.dart';
import 'package:dart_openvidu_api/src/models/session_model.dart';
import 'package:dio/dio.dart';

class ConnectionEndpoint {
  final Dio _dio;
  final path = '/openvidu/api/sessions';

  ConnectionEndpoint(this._dio);

  /// Create a new Connection in the Session
  ///
  /// METHOD	POST
  /// URL	https://YOUR_OPENVIDUSERVER_IP/openvidu/api/sessions/SESSION_ID/connection
  /// HEADERS	Authorization: Basic EncodeBase64(OPENVIDUAPP:<YOUR_SECRET>)
  /// Content-Type: application/json
  Future<ConnectionModel> createConnection(
      String sessionId, ConnectionModel connectionModel) async {
    var response = await _dio.post(path + "/$sessionId/connection",
        data: connectionModel.toJson());

    if (response.statusCode != 200) throw Exception(response.statusMessage);
    print(response.statusMessage);
    return ConnectionModel.fromJson(response.data);
  }

  /// Get a Connection from a Session
  ///
  /// METHOD	GET
  /// URL	https://YOUR_OPENVIDUSERVER_IP/openvidu/api/sessions/SESSION_ID/connection/CONNECTION_ID
  /// HEADERS	Authorization: Basic EncodeBase64(OPENVIDUAPP:<YOUR_SECRET>)
  Future<ConnectionModel> getConnection(
      String sessionId, String connectionId) async {
    var response =
        await _dio.get(path + "/$sessionId/connection/$connectionId");

    if (response.statusCode != 200) throw Exception(response.statusMessage);
    print(response.statusMessage);
    return ConnectionModel.fromJson(response.data);
  }

  /// List all Connections from a Session
  ///
  /// METHOD	GET
  /// URL	https://YOUR_OPENVIDUSERVER_IP/openvidu/api/sessions/SESSION_ID/connection
  /// HEADERS	Authorization: Basic EncodeBase64(OPENVIDUAPP:<YOUR_SECRET>)
  Future<ConnectionsModel> getAllConnections(String sessionId) async {
    var response = await _dio.get(path + "/$sessionId/connection");
    if (response.statusCode != 200) throw Exception(response.statusMessage);
    print(response.statusMessage);
    return ConnectionsModel.fromJson(response.data);
  }

  /// Force the disconnection of a user from a Session.
  ///
  /// All of the streams associated to this Connection (both publishers and subscribers) will be destroyed.
  /// If the user was publishing a stream, all other subscribers of other users receiving it will also be destroyed.
  /// If the CONNECTION_ID belongs to a Connection in pending status, this method will simply invalidate it
  /// (its token will be no longer available for any user to connect to the Session)
  Future<void> dissconnectUser(String sessionId, String connectionId) async {
    var response =
        await _dio.delete(path + "/$sessionId/connection/$connectionId");
    if (response.statusCode != 200) throw Exception(response.statusMessage);
    print(response.statusMessage);
  }
}
