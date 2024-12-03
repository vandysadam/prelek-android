// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/auth_bloc.dart';
// import '../login_screen.dart';
// import '../pallete.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AuthBloc(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData.dark().copyWith(
//           scaffoldBackgroundColor: Pallete.backgroundColor,
//         ),
//         home: const LoginScreen(),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_apps_app/config/routes/routes_name.dart';
import 'package:mobile_apps_app/repository/auth/login_repository.dart';
import 'package:mobile_apps_app/repository/auth/user_login_repository.dart';
import 'package:mobile_apps_app/repository/history/history_repository.dart';
import 'package:mobile_apps_app/repository/payment/pay_repository.dart';
import 'package:mobile_apps_app/repository/profile/get_user_byid_repository.dart';
import 'package:mobile_apps_app/services/session/session_controller.dart';

import 'config/routes/routes.dart';

GetIt getIt = GetIt.instance;
void main() async {
  serviceLocator();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  getIt.registerLazySingleton<SessionController>(() => SessionController());
  getIt.registerLazySingleton<UserLoginRepository>(
      () => UserLoginRepositoryImpl());
  getIt.registerLazySingleton<PayRepository>(() => PayHttpApiRepository());
  getIt.registerLazySingleton<GetUserByidRepository>(
      () => GetUserHttpApiRepository());
  getIt.registerLazySingleton<HistoryTransactionRepository>(
      () => HistoryTransactionHttpRepository());
}
