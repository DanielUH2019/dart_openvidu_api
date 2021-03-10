import 'package:dart_openvidu_api/src/models/session_model.dart';
import 'package:dio/dio.dart';

class SessionEndpoint {
  final Dio _dio;
  final path = "/openvidu/api/sessions";

  SessionEndpoint(this._dio);

  Future<SessionModel> initializeSession(SessionModel sessionModel) async {
    var response = await _dio.post(path, data: sessionModel.toJson());
    return SessionModel.fromJson(response.data);
  }

  Future<SessionModel> getSession(String sessionId) async {
    var response = await _dio.get(path + "/$sessionId");
    return SessionModel.fromJson(response.data);
  }

  Future<ConnectionsModel> getAllSessions() async {
    var response = await _dio.get(path);
    return ConnectionsModel.fromJson(response.data);
  }

  void closeSession(String sessionId) async {
    await _dio.delete(path);
  }
}
