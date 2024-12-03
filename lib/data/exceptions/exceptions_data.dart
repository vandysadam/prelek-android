import 'package:flutter/material.dart';

class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix = '']);

  @override
  String toString() {
    debugPrint("Exception: $_prefix$_message");
    return "$_message$_prefix";
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message])
      : super(message, "No Internet Connection ");
}

class UnauthorizedExceptions extends AppExceptions {
  UnauthorizedExceptions([String? message])
      : super(message, "You Dont Have Access To This ");
}

class RequestTimeOutExceptions extends AppExceptions {
  RequestTimeOutExceptions([String? message])
      : super(message, "Request Time Out ");
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}
