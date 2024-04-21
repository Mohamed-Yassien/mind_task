// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mind_task_app/core/shared/my_loading.dart';

import '../../../core/utils/alerts.dart';
import '../../../core/utils/utils.dart';


class DioHelper {
  static Dio mydio = Dio();

  static void init() {
    mydio = Dio(
      BaseOptions(
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          },
          baseUrl: 'https://ihoneyherb.com/test-application/',
          receiveDataWhenStatusError: true,
          connectTimeout: 60000,
          receiveTimeout: 60000,
          sendTimeout: 60000),
    )..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
  }

  static Future<Response?> postData(
    BuildContext context, {
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    String? token,
    String? guestIdentifier,
    bool loading = false,
    bool isForm = false,
    void Function(int, int)? onSendProgress,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'X-Guest-Identifier': guestIdentifier,
    };
    try {
      if (loading) {
        MyLoading.show(context);
      }
      final response = await mydio.post(
        url,
        onSendProgress: onSendProgress,
        queryParameters: query,
        data: isForm ? FormData.fromMap(body ?? {}) : body,
      );
      if (loading) {
        MyLoading.dismis(context);
      }
      debugPrint('ressssssss is $response');
      return response;
    } on DioError catch (e) {
      print('e is $e');

      getDioError(e: e, context: context);
    } catch (e) {
      print('e is $e');
      return null;
    }
    return null;
  }

  static Future<Response?> getWithBody(
    BuildContext context, {
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    String? token,
    String? guestIdentifier,
    bool loading = false,
    bool isForm = false,
    void Function(int, int)? onSendProgress,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'X-Guest-Identifier': guestIdentifier,
    };
    try {
      if (loading) {
        MyLoading.show(context);
      }
      final response = await mydio.request(url,
          onSendProgress: onSendProgress,
          queryParameters: query,
          options: Options(method: "GET"),
          data: isForm ? FormData.fromMap(body ?? {}) : body);
      if (loading) {
        MyLoading.dismis(context);
      }
      return response;
    } on DioError catch (e) {
      getDioError(e: e, context: context);
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<Response?> putData(
    BuildContext context, {
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    String? token,
    String? guestIdentifier,
    bool loading = false,
    bool isForm = false,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'X-Guest-Identifier': guestIdentifier,
    };
    try {
      if (loading) {
        MyLoading.show(context);
      }
      final response = await mydio.put(url,
          queryParameters: query,
          data: isForm ? FormData.fromMap(body ?? {}) : body);
      if (loading) {
        MyLoading.dismis(context);
      }
      return response;
    } on DioError catch (e) {
      getDioError(e: e, context: context);
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<Response?> deleteData(
    BuildContext context, {
    required String url,
    Map<String, dynamic>? query,
    String? token,
    bool loading = false,
    String? guestIdentifier,
    Map<String, dynamic>? body,
    bool isForm = false,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'X-Guest-Identifier': guestIdentifier,
    };

    try {
      if (loading) {
        MyLoading.show(context);
      }
      final response = await mydio.delete(url,
          queryParameters: query,
          data: isForm ? FormData.fromMap(body ?? {}) : body);
      if (loading) {
        MyLoading.dismis(context);
      }
      return response;
    } on DioError catch (e) {
      getDioError(e: e, context: context);
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<Response?> getData(
    BuildContext context, {
    required String url,
    Map<String, dynamic>? query,
    String? token,
    String? guestIdentifier,
    bool loading = false,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'X-Guest-Identifier': guestIdentifier,
    };

    try {
      if (loading) {
        MyLoading.show(context);
      }
      final response = await mydio.get(
        url,
        queryParameters: query,
      );
      if (loading) {
        MyLoading.dismis(context);
      }
      return response;
    } on DioError catch (e) {
      getDioError(e: e, context: context);
    } catch (e) {
      return null;
    }
    return null;
  }

  static getDioError({required DioError e, required BuildContext context}) {
    log("---------------autherrr");
    MyLoading.dismis(context);

    if (DioErrorType.receiveTimeout == e.type ||
        DioErrorType.connectTimeout == e.type) {
      OverLays.snack(context,
          text: "Connetion timeout", state: SnakState.failed);
      log('case 1');
      log('Server is not reachable. Please verify your internet connection and try again');
    } else if (DioErrorType.response == e.type) {
      log('case 2');
      log('Server reachable. Error in resposne');
      OverLays.snack(context,
          text: e.response?.data["message"] ?? "defaultNetworkError".tr(),
          state: SnakState.failed);

      log("hello im errroe");
      if (e.response!.statusCode == 401) {
        Utiles.removeToken();
        // Navigator.pushNamed(context, Routes.loginScreen);
        OverLays.snack(context,
            text: e.response!.data["message"], state: SnakState.failed);
      }
    } else if (DioErrorType.other == e.type) {
      if (e.message.contains('SocketException')) {
        log('Network error');
        log('case 3');
        OverLays.snack(context, text: "No Network", state: SnakState.failed);
      }
    } else {
      // show snak server error

      log('case 4');
      log('Problem connecting to the server. Please try again.');
    }
    return null;
  }
}
