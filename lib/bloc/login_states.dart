part of 'login_bloc.dart';

class LoginStates extends Equatable {
  const LoginStates({
    this.login_id = '',
    this.password = '',
    this.message = '',
    this.postApiStatus = PostApiStatus.initial,
  });

  final String login_id;
  final String password;
  final String message;
  final PostApiStatus postApiStatus;

  LoginStates copyWith(
      {String? login_id,
      String? password,
      String? message,
      PostApiStatus? postApiStatus}) {
    return LoginStates(
      login_id: login_id ?? this.login_id,
      password: password ?? this.password,
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object> get props => [login_id, password, postApiStatus, message];
}
