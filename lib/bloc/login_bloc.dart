import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_apps_app/models/user/user_model.dart';
import 'package:mobile_apps_app/repository/auth/login_repository.dart';
import 'package:mobile_apps_app/repository/auth/user_login_repository.dart';
import 'package:mobile_apps_app/services/session/session_controller.dart';
import 'package:mobile_apps_app/utils/enums.dart';

part 'login_events.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  LoginRepository loginRepository;
  UserLoginRepository userLoginRepository;

  LoginBloc({required this.loginRepository, required this.userLoginRepository})
      : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
    on<UserLogin>(_userLogin);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    emit(
      state.copyWith(
        login_id: event.login_id,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  void _loginApi(LoginApi event, Emitter<LoginStates> emit) async {
    Map data = {
      "login_id": state.login_id,
      "password": state.password,
    };

    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );

    await loginRepository.loginApi(data).then((response) async {
      if (response.error.isNotEmpty) {
        emit(
          state.copyWith(
              message: response.error.toString(),
              postApiStatus: PostApiStatus.error),
        );
      } else {
        var accessToken = response.accessToken;
        var refreshToken = response.refreshToken;
        var roles = response.roles;

        var userModel = UserModel(
          id: response.id,
          name: response.name,
          email: response.email,
          roles: roles,
          house_number: response.house_number,
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

        await SessionController()
            .saveUserInPreference(userModel, accessToken, refreshToken);
        await SessionController().getUserFromPreference();

        emit(
          state.copyWith(
              message: 'Successfully logged in',
              postApiStatus: PostApiStatus.success),
        );
      }
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(
            message: error.toString(), postApiStatus: PostApiStatus.error),
      );
    });
  }

  void _userLogin(UserLogin event, Emitter<LoginStates> emit) async {
    Map data = {
      "login_id": int.tryParse(state.login_id) ?? state.login_id,
      "password": state.password,
    };

    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );

    await userLoginRepository.userLogin(data).then((response) async {
      if (response.error.isNotEmpty) {
        emit(
          state.copyWith(
              message: response.error.toString(),
              postApiStatus: PostApiStatus.error),
        );
      } else {
        var accessToken = response.accessToken;
        var refreshToken = response.refreshToken;
        var roles = response.roles;

        var userModel = UserModel(
          id: response.id,
          name: response.name,
          email: response.email,
          roles: roles,
          house_number: response.house_number,
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

        await SessionController()
            .saveUserInPreference(userModel, accessToken, refreshToken);
        await SessionController().getUserFromPreference();

        emit(
          state.copyWith(
              message: 'Successfully logged in',
              postApiStatus: PostApiStatus.success),
        );
      }
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(
            message: error.toString(), postApiStatus: PostApiStatus.error),
      );
    });
  }
}
