import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_apps_app/models/profile/profile_model.dart';
import 'package:mobile_apps_app/repository/profile/get_user_byid_repository.dart';
import 'package:mobile_apps_app/services/session/session_controller.dart';

part 'profile_bloc_event.dart';
part 'profile_bloc_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserHttpApiRepository repository;
  final SessionController sessionController;

  ProfileBloc({
    required this.repository,
    required this.sessionController,
  }) : super(ProfileInitial()) {
    // Menggunakan `on<Event>` untuk menangani GetProfileEvent
    on<GetProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profile = await repository.getId(event.userId);
        debugPrint('fetching profile for user ID: ${event.userId}');

        debugPrint('Profile loaded: ${profile.toJson()}');
        emit(ProfileLoaded(profile));
      } catch (e) {
        emit(ProfileError('Failed to load profile: ${e.toString()}'));
      }
    });
  }
}
