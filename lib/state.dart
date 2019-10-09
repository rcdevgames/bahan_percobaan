import 'package:equatable/equatable.dart';
import 'package:sample_listing/model.dart';

abstract class WorkerState extends Equatable {
  WorkerState([List props = const []]) : super(props);
}

class UndefinedModel extends WorkerState {
  @override
  String toString() => 'UndefinedModel';
}

class WorkerLoaded extends WorkerState {
  final List<Datum> data;
  final int page;
  final bool maxReach;

  WorkerLoaded({this.data, this.page, this.maxReach}) : super([data, page, maxReach]);
  WorkerLoaded copyWith({
    List<Datum> data,
    int page,
    bool maxReach
  }) {
    return WorkerLoaded(
      data: data ?? this.data,
      page: page ?? this.page,
      maxReach: maxReach ?? this.maxReach
    );
  }

  @override
  String toString() =>
      'PostLoaded { data: ${data.length}, page: $page, hasReachedMax: $maxReach }';
}

class WorkerLoad extends WorkerState {
  @override
  String toString() => 'WorkerLoading';
}