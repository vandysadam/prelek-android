// class AppUrl {
//   static String loginApi = 'https://reqres.in/api/login';
// }

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl {
  static String loginApi =
      '${dotenv.env['API_BASE_URL']}${dotenv.env['LOGIN_API_ENDPOINT']}';

  static String payApi =
      '${dotenv.env['API_BASE_URL']}${dotenv.env['PAY_API_ENDPOINT']}';

  static String userloginApi =
      '${dotenv.env['API_BASE_URL']}${dotenv.env['USER_LOGIN_API_ENDPOINT']}';

  static String profileApi(String userId) =>
      '${dotenv.env['API_BASE_URL']}${dotenv.env['PROFILE_API']}/$userId';

  static String userHistory =
      '${dotenv.env['API_BASE_URL']}${dotenv.env['HISTORY_API']}';
}


// https://reqres.in/api/login
// http://10.0.2.2:3000/auth/admin/login?