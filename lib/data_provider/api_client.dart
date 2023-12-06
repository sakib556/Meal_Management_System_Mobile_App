import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meal_management/constant/app_url.dart';
import 'package:meal_management/constant/constant_key.dart';
import 'package:meal_management/data_provider/pref_helper.dart';
import 'package:meal_management/global/model/global_response.dart';
import 'package:meal_management/global/widget/global_loader.dart';
import 'package:meal_management/utils/app_routes.dart';
import 'package:meal_management/utils/enum.dart';
import 'package:meal_management/utils/extension.dart';
import 'package:meal_management/utils/navigation.dart';
import 'package:meal_management/utils/network_connection.dart';
import 'package:meal_management/utils/styles/styles.dart';
import 'package:meal_management/utils/view_util.dart';

class ApiClient {
  final Dio _dio = Dio();
  Map<String, dynamic> _header = {};
  bool? isPopDialog;

  _initDio({Map<String, String>? extraHeader}) async {
    _header = await _getHeaders();
    if (extraHeader != null) {
      _header.addAll(extraHeader);
    }

    _dio.options = BaseOptions(
      baseUrl: AppUrl.base.url,
      headers: _header,
      connectTimeout: const Duration(milliseconds: 60 * 1000),
      sendTimeout: const Duration(milliseconds: 60 * 1000),
      receiveTimeout: const Duration(milliseconds: 60 * 1000),
    );
    _initInterceptors();
  }

  void _initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      debugPrint(
          'REQUEST[${options.method}] => PATH: ${AppUrl.base.url}${options.path} '
          '=> Request Values: param: ${options.queryParameters}, DATA: ${options.data}, => _HEADERS: ${options.headers}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      debugPrint(
          'RESPONSE[${response.statusCode}] => DATA: ${response.data} URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}');
      return handler.next(response);
    }, onError: (err, handler) {
      debugPrint(
          'ERROR[${err.response?.statusCode}] => DATA: ${err.response?.data} Message: ${err.message} URL: ${err.response?.requestOptions.baseUrl}${err.response?.requestOptions.path}');
      return handler.next(err);
    }));
  }

  // Image or file upload using Rest handle.
  Future requestFormData({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
    bool? isPopGlobalDialog,
    String? token,
    Options? options,
    void Function(int, int)? onReceiveProgress,
    String? savePath,
    List<File>? files,
    String? fileKeyName,
    required Function(Response response) onSuccessFunction,
    bool showLoader = false,
  }) async {
    final tokenHeader = <String, String>{
      HttpHeaders.contentTypeHeader: AppConstant.MULTIPART_FORM_DATA.key
    };
    await _initDio(extraHeader: tokenHeader);

    if (files != null) {
      params?.addAll({
        "$fileKeyName": files
            .map((item) => MultipartFile.fromFileSync(item.path,
                filename: item.path.split('/').last))
            .toList()
      });
    }

    final data = FormData.fromMap(params!);
    data.log();
    // Handle and check all the status.
    return clientHandle(
      url,
      method,
      params,
      data: data,
      showLoader: showLoader,
      onSuccessFunction: onSuccessFunction,
    );
  }

  // Normal Rest API  handle.
  Future request({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
    bool? isPopGlobalDialog,
    String? token,
    Options? options,
    void Function(int, int)? onReceiveProgress,
    String? savePath,
    Map<String, String>? extraHeaders,
    required Function(Response response) onSuccessFunction,
    bool showLoader = false,
  }) async {
    //use this for extra header
    final tokenHeader = <String, String>{
      //  AppConstant.PUSH_ID.key: PrefHelper.getString(AppConstant.DEVICE_ID.key),
    };

    if (extraHeaders != null) {
      tokenHeader.addAll(extraHeaders);
    }

    if (NetworkConnection.instance.isInternet) {
      // Handle and check all the status.
      isPopDialog = isPopGlobalDialog;
      await _initDio(extraHeader: tokenHeader);
      // checkProxy();
      return clientHandle(
        url,
        method,
        params,
        options: options,
        savePath: savePath,
        showLoader: showLoader,
        onReceiveProgress: onReceiveProgress,
        onSuccessFunction: onSuccessFunction,
      );
    } else {
      _handleNoInternet(
        apiParams: APIParams(
          url: url,
          method: method,
          variables: params ?? {},
          onSuccessFunction: onSuccessFunction,
        ),
      );
    }
  }

// Handle all the method and error.
  Future clientHandle(
    String url,
    Method method,
    Map<String, dynamic>? params, {
    dynamic data,
    Options? options,
    String? savePath,
    void Function(int, int)? onReceiveProgress,
    required Function(Response response)? onSuccessFunction,
    required bool showLoader,
  }) async {
    Response response;
    try {
      if (showLoader == true) {
        ViewUtil.showAlertDialog(
          content: const GlobalLoader(),
          barrierDismissible: false,
        );
      }
      // Handle response code from api.
      if (method == Method.POST) {
        print("post data ${params.toString()}");
        response = await _dio.post(
          url,
          // queryParameters: params,
          data: data ?? params,
        );
        print("post response ${response.toString()}.....");
        print("post end");
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else if (method == Method.DOWNLOAD) {
        response = await _dio.download(
          url,
          savePath,
          queryParameters: params,
          options: options,
          onReceiveProgress: onReceiveProgress,
        );
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
          options: options,
          onReceiveProgress: onReceiveProgress,
        );
      }

      if (showLoader == true) {
        Navigation.pop(Navigation.key.currentContext);
      }
      /**
       * Handle Rest based on response json
       * So please check in json body there is any status_code or code
       */
      _handleResponse(
        response: response,
        onSuccessFunction: onSuccessFunction,
      );

      // Handle Error type if dio catches anything.
    } on DioException catch (e) {
      e.log();
      if (showLoader == true) {
        Navigation.pop(Navigation.key.currentContext);
      }
      if (e.response?.statusCode == 500) {
        ViewUtil.SSLSnackbar(
            e.response?.statusMessage ?? "Internal Server Error",
            color: KColor.red.color);
      } else {
        _handleDioError(e);
      }
      rethrow;
    } catch (e) {
      "dioErrorCatch $e".log();
      if (showLoader == true) {
        Navigation.pop(Navigation.key.currentContext);
      }
      throw Exception("Something went wrong$e");
    }
  }

  Future<Map<String, String>> _getHeaders() async {
    final Map<String, String> _header = {
      HttpHeaders.contentTypeHeader: AppConstant.APPLICATION_JSON.key,
      HttpHeaders.authorizationHeader:
          "${AppConstant.BEARER.key} ${PrefHelper.getString(AppConstant.TOKEN.key)}",
    };

    return _header;
  }

  void _handleNoInternet({
    required APIParams apiParams,
  }) {
    NetworkConnection.instance.apiStack.add(apiParams);

    if (ViewUtil.isPresentedDialog == false) {
      ViewUtil.isPresentedDialog = true;
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ViewUtil.showInternetDialog(
            onPressed: () {
              if (NetworkConnection.instance.isInternet == true) {
                Navigator.of(Navigation.key.currentState!.overlay!.context,
                        rootNavigator: true)
                    .pop();
                ViewUtil.isPresentedDialog = false;
                for (var element in NetworkConnection.instance.apiStack) {
                  request(
                    url: element.url,
                    method: element.method,
                    params: element.variables,
                    onSuccessFunction: element.onSuccessFunction,
                  );
                }
                NetworkConnection.instance.apiStack = [];
              }
            },
          );
        },
      );
    }
  }

  void _handleDioError(DioException error) {
    switch (error.type) {
      case DioException.connectionTimeout:
        ViewUtil.SSLSnackbar("Time out delay ");
        break;
      case DioException.receiveTimeout:
        ViewUtil.SSLSnackbar("Server is not responded properly");
        break;
      case DioException.connectionError:
        ViewUtil.SSLSnackbar("Server is not responded properly");
        break;
      case DioException.badResponse:
        final Map data = json.decode(error.response.toString());
        "ERROR IS: $data".log();
        _tempErrorHandle(data);

        // ViewUtil.SSLSnackbar("Internal Responses error",
        //     color: KColor.red.color);
        throw Exception(data['message'] ?? "Something went wrong");
      default:
        ViewUtil.SSLSnackbar("Something went wrong");
        break;
    }
  }

  Future<void> _handleResponse({
    required Response response,
    required Function(Response response)? onSuccessFunction,
  }) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map data = json.decode(response.toString());
      print(data.toString());
      print("status 200 or 201");
      print("status 200 or 201");
      final verifycode = data['status'];
      final String message = data['message'] ?? "Something went wrong";
      int code = int.tryParse(verifycode.toString()) ?? 0;
      if (code == 200 || code == 201) {
        if (response.data != null) {
          return onSuccessFunction!(response);
        } else {
          "response data is ${response.data}".log();
          throw Exception("response data is ${response.data}");
        }
      } else if (code == 401) {
        ViewUtil.SSLSnackbar(
          message,
          color: Colors.red,
        );
        PrefHelper.logout().then((value) {
          Navigation.pushAndRemoveUntil(
            Navigation.key.currentContext,
            appRoutes: AppRoutes.landing,
          );
        });
      } else {
        //Where error occured then pop the global dialog
        response.statusCode?.log();
        code.toString().log();
        isPopDialog?.log();

        _tempErrorHandle(data);
      }
    }
  }

  void _tempErrorHandle(dynamic data) async {
    try {
      GlobalResponse globalErrorResponse = GlobalResponse.fromJson(data);

      if (globalErrorResponse.status == 401) {
        ViewUtil.SSLSnackbar(
          globalErrorResponse.message ?? "Something went wrong",
          color: Colors.red,
        );
        PrefHelper.logout().then((value) {
          Navigation.pushAndRemoveUntil(
            Navigation.key.currentContext,
            appRoutes: AppRoutes.landing,
          );
        });
      } else {
        ViewUtil.SSLSnackbar(
          globalErrorResponse.message ?? "Something went wrong",
          color: Colors.red,
        );
      }
    } catch (e) {
      ViewUtil.SSLSnackbar(
        "Server Error",
        color: Colors.red,
      );
    }
  }
}
