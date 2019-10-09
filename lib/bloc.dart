import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:sample_listing/model.dart';

class ListBloc extends Bloc<int, Model> {
  @override
  get initialState => UndefinedModel();

  @override
  Stream<Model> mapEventToState(event) async* {
    if (event != null) {
      try {
        Model list = await Model.searchWorker();
        yield list;
      } catch (_) {}
    }
  }
  
}