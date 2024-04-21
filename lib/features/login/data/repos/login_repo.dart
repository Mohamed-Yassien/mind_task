import 'package:mind_task_app/data/endpoints/endpoint.dart';
import 'package:mind_task_app/data/sources/api/dio.dart';
import 'package:mind_task_app/features/login/data/models/user_model.dart';
import 'package:mind_task_app/features/login/data/requests/login_request.dart';

class LoginRepository {
  static Future<UserModel?> login({
    required context,
    required LoginRequest loginRequest,
  }) async {
    final response = await DioHelper.postData(
      context,
      url: EndPoints.login,
      body: loginRequest.toJson(),
      loading: true,
      isForm: true,
    );
    if (response?.statusCode == 200) {
      return UserModel.fromJson(response?.data);
    } else {
      return null;
    }
  }
}
