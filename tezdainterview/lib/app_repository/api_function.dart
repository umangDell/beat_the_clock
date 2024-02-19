import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_class.dart';

class APIFunction {
  Future<dynamic> apiCall({
    required String apiName,
    required BuildContext context,
    FormData? params,
    String? token = "",
    Object? withOutFormData,
    Map<String, dynamic>? queryParameters,
    bool isGet = false,
    bool isLoading = true,
  }) async {
    if (isGet != true && params != null) {
      log("params -------->>> ${params.fields}");
      print("params -------->>> ${params.files}");
    }
    if (isGet == true) {
      var response = await HttpUtil(token!, isLoading, context).get(
        apiName,
        queryParameters: queryParameters,
      );
      return response;
    }

    var response = await HttpUtil(token!, isLoading, context).post(
      apiName,
      data: params,
      token: token,
      withOutFormData: withOutFormData,
    );
    return response;
  }
}
