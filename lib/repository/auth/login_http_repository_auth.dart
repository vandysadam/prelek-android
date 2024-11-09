import 'package:mobile_apps_app/config/app_url.dart';
import 'package:mobile_apps_app/data/network/network_services_api.dart';
import 'package:mobile_apps_app/models/user/user_model.dart';
import 'package:mobile_apps_app/repository/auth/login_repository.dart';

class LoginHttpApiRepository implements LoginRepository {
  final _api = NetworkServicesApi();

  @override
  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginApi, data);

    return UserModel.fromJson(response);
  }
}
