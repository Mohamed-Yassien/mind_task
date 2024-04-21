import 'package:mind_task_app/data/endpoints/endpoint.dart';
import 'package:mind_task_app/data/sources/api/dio.dart';
import 'package:mind_task_app/features/home/data/models/home_data_model.dart';

class HomeRepository {
  static Future<HomeDataModel?> getHomeData({
    required context,
  }) async {
    final response = await DioHelper.getData(
      context,
      url: EndPoints.home,
    );
    if (response?.statusCode == 200) {
      return HomeDataModel.fromJson(response?.data);
    } else {
      return null;
    }
  }
}
