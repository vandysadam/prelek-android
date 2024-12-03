part of 'history_bloc.dart';

// sealed class HistoryEvent extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// final class HistoryFetched extends HistoryEvent {}
abstract class HistoryEvent {}

class HistoryFetched extends HistoryEvent {
  // final String? accessToken;

  // HistoryFetched(this.accessToken);
}
