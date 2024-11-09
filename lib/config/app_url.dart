// class AppUrl {
//   static String loginApi = 'https://reqres.in/api/login';
// }

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl {
  static String loginApi =
      '${dotenv.env['API_BASE_URL']}${dotenv.env['LOGIN_API_ENDPOINT']}';
}


// https://reqres.in/api/login
// http://10.0.2.2:3000/auth/admin/login?