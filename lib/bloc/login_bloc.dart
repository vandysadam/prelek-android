import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_apps_app/repository/auth/login_repository.dart';
import 'package:mobile_apps_app/services/session/session_controller.dart';
import 'package:mobile_apps_app/utils/enums.dart';

part 'login_events.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
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

    await loginRepository.loginApi(data).then((value) async {
      if (value.error.isNotEmpty) {
        emit(
          state.copyWith(
              message: value.error.toString(),
              postApiStatus: PostApiStatus.error),
        );
      } else {
        await SessionController().saveUserInPreference(value);
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
