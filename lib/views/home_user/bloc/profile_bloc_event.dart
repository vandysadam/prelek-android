// profile_event.dart
part of 'profile_bloc_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {
  final String userId;

  GetProfileEvent(this.userId);
}
