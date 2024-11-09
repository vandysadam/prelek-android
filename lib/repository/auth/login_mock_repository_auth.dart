import 'package:mobile_apps_app/models/user/user_model.dart';
import 'package:mobile_apps_app/repository/auth/login_repository.dart';

class LoginMockApiRepository implements LoginRepository {
  Future<UserModel> loginApi(dynamic data) async {
    await Future.delayed(const Duration(seconds: 2));

    final response = {'token': 'asdsadjasdlasdj'};

    return UserModel.fromJson(response);
  }
}
