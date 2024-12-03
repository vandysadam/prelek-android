import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_apps_app/data/exceptions/exceptions_data.dart';
import 'package:mobile_apps_app/data/network/base_api_service.dart';

class NetworkServicesApi implements BaseApiService {
  @override
  Future<dynamic> getApi(String url, {Map<String, String>? headers}) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 200));
      debugPrint('GET request URL: $url');
      jsonResponse = _returnResponse(response);
    } on SocketException {
      debugPrint('No internet connection');
      throw NoInternetException('No Internet connection.');
    } on TimeoutException {
      debugPrint('Request timed out 1');
      throw NoInternetException('Request timed out. Please try again.');
    } catch (e) {
      debugPrint('Unexpected error: $e');
      throw AppExceptions('An unexpected error occurred.');
    }

    return jsonResponse;
  }

  Future<dynamic> getTokenApi(String url,
      {String? token, required Map<String, String> headers}) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 30));

      debugPrint('POST request URL: $url');

      jsonResponse = _returnResponse(response);
    } on SocketException {
      debugPrint('No internet connection');
      throw NoInternetException('No Internet connection.');
    } on TimeoutException {
      debugPrint('Request timed out');
      throw NoInternetException('Request timed out. Please try again.');
    } catch (e) {
      debugPrint('Unexpected error: $e');
      throw AppExceptions('An unexpected error occurred.');
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, dynamic data, {String? token}) async {
    dynamic jsonResponse;
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };

      final response = await http
          .post(Uri.parse(url), headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 30));

      debugPrint('POST request URL: $url');
      debugPrint('POST request data: $data');
      jsonResponse = _returnResponse(response);
    } on SocketException {
      debugPrint('No internet connection');
      throw NoInternetException('No Internet connection.');
    } on TimeoutException {
      debugPrint('Request timed out');
      throw NoInternetException('Request timed out. Please try again.');
    } catch (e) {
      debugPrint('Unexpected error: $e');
      throw AppExceptions('An unexpected error occurred.');
    }

    return jsonResponse;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        debugPrint('Bad request successssssss');
        debugPrint('Bad request successssssss body ${response.body}');
        debugPrint(
            'Bad request successssssss status code ${response.statusCode}');

        final responseDataSuccess = jsonDecode(response.body);
        debugPrint(
            'Parsed message successssssss : ${responseDataSuccess['message']}');

        return {
          'statusCode': response.statusCode,
          'data': responseDataSuccess,
          'message': responseDataSuccess['message'],
        };
      //jsonDecode(response.body); // Return decoded JSON body
      case 400:
        debugPrint('Bad request error');
        debugPrint('Bad request error body ${response.body}');
        debugPrint('Bad request error status code ${response.statusCode}');

        final responseData = jsonDecode(response.body);
        debugPrint('Parsed message: ${responseData['message']}');

        return {
          'statusCode': response.statusCode,
          'data': responseData,
          'message': responseData['message'],
        };
      // throw AppExceptions("Bad request (400): ${_extractMessage(response)}");
      case 401:
        var message = _extractMessage(response);
        debugPrint('Unauthorized error: $message');
        throw UnauthorizedExceptions(message);
      case 500:
        var message = _extractMessage(response);
        debugPrint('Server error: $message');
        throw FetchDataException(
            "Server error (Status Code: ${response.statusCode}): $message");
      default:
        debugPrint('Unexpected error with status code: ${response.statusCode}');
        throw AppExceptions("Unexpected Error: ${response.statusCode}");
    }
  }

  String _extractMessage(http.Response response) {
    try {
      final decodedResponse = jsonDecode(response.body);
      final message = decodedResponse['message'] ??
          decodedResponse['error'] ??
          'An unknown error occurred';
      debugPrint('Extracted error message: $message');
      return message;
    } catch (e) {
      debugPrint('Failed to parse error message: $e');
      return 'An error occurred, but the message could not be parsed.';
    }
  }
}
