import 'package:equatable/equatable.dart';
import 'package:sample_listing/worker.dart';

abstract class SingleState extends Equatable {
  SingleState([List props = const []]) : super(props);
}

class UndefinedSingle extends SingleState {
  @override
  String toString() => 'UndefinedWorker';
}

class SingleLoaded extends SingleState {
  Worker data;
  
  SingleLoaded({this.data}) : super([data]);
  SingleLoaded copyWith({Worker data}) => SingleLoaded(data: this.data);

  @override
  String toString() => 'UndefinedModel';
}