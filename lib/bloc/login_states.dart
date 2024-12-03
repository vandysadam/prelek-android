part of 'login_bloc.dart';

class LoginStates extends Equatable {
  const LoginStates({
    // this.login_id = '',
    // this.password = '',
    // this.message = '',
    // this.postApiStatus = PostApiStatus.initial,
    // this.user,
    // this.accessToken = '',
    // this.refreshToken = '',
    this.login_id = '',
    this.password = '',
    this.message = '',
    this.postApiStatus = PostApiStatus.initial,
  });

  // final String login_id;
  // final String password;
  // final String message;
  // final PostApiStatus postApiStatus;
  // final User? user;
  // final String accessToken;
  // final String refreshToken;

  final String login_id;
  final String password;
  final String message;
  final PostApiStatus postApiStatus;

  LoginStates copyWith({
    // String? login_id,
    // String? password,
    // String? message,
    // PostApiStatus? postApiStatus,
    // User? user,
    // String? accessToken,
    // String? refreshToken,

    String? login_id,
    String? password,
    String? message,
    PostApiStatus? postApiStatus,
  }) {
    return LoginStates(
      // login_id: login_id ?? this.login_id,
      // password: password ?? this.password,
      // message: message ?? this.message,
      // postApiStatus: postApiStatus ?? this.postApiStatus,
      // user: user ?? this.user,
      // accessToken: accessToken ?? this.accessToken,
      // refreshToken: refreshToken ?? this.refreshToken,
      login_id: login_id ?? this.login_id,
      password: password ?? this.password,
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object?> get props => [
        login_id,
        password,
        postApiStatus,
        message,
        // user,
        // accessToken,
        // refreshToken
      ];

  // List<Object> get props => [login_id, password, postApiStatus, message];
}

// class User {
//   final String id;
//   final String name;
//   final String email;
//   final String roles;
//   final int houseNumber;

//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.roles,
//     required this.houseNumber,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       roles: json['roles'],
//       houseNumber: json['house_number'],
//     );
//   }
// }
