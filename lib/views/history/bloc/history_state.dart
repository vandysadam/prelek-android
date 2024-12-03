part of 'history_bloc.dart';

enum HistoryStatus { initial, success, failure }

final class HistoryState extends Equatable {
  const HistoryState({
    this.status = HistoryStatus.initial,
    this.posts = const <HistoryModel>[],
    this.hasReachedMax = false,
  });

  final HistoryStatus status;
  final List<HistoryModel> posts;
  final bool hasReachedMax;

  HistoryState copyWith({
    HistoryStatus? status,
    List<HistoryModel>? posts,
    bool? hasReachedMax,
  }) {
    return HistoryState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''HistoryState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];
}
