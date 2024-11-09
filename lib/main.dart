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
import 'package:mobile_apps_app/repository/auth/login_http_repository_auth.dart';
import 'package:mobile_apps_app/repository/auth/login_mock_repository_auth.dart';
import 'package:mobile_apps_app/repository/auth/login_repository.dart';

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
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpApiRepository());
}
