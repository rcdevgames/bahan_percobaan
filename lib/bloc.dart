import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sample_listing/model.dart';
import 'package:sample_listing/state.dart';
import 'package:http/http.dart' as http;
import 'package:sample_listing/state_2.dart';
import 'package:sample_listing/worker.dart';

class ListBloc extends HydratedBloc<int, WorkerState> {
  var loading = false;

  @override
  get initialState => UndefinedModel();

  @override
  Stream<WorkerState> mapEventToState(event) async* {
    if (event != null) {
      try {
        if (currentState is UndefinedModel) {
          if (loading == false) {
            loading = true;
            print("call API");
            Model list = await searchWorker(event);
            yield WorkerLoaded(data: list.data, page: list.page, maxReach: false);
            loading = false;
          }
        }else if (currentState is WorkerLoaded) {
          if (loading == false) {
            loading = true;
            Model list = await searchWorker(event);
            print("loading : $loading");
            yield WorkerLoaded(data: (currentState as WorkerLoaded).data + list.data, page: list.page, maxReach: false);
            loading = false;
          }
        }
      } catch (_) {}
    }
  }

  static Future<Model> searchWorker([page = 1]) async {
    String apiUrl = "http://api.housesolutionsindonesia.com/api/v1/customer/search/bbe439c339c73c3c15aa68b72446d385490ca27e";
    String body = jsonEncode({"id_province":"all","id_district":[],"id_category":"all","salary_from":0,"salary_until":0,"rating_from":0,"rating_until":0,"page":page,"limit":10});
    print(body);
    
    var apiResult = await http.post(apiUrl, body: body, headers: {"Content-Type":"application/json"});
    var jsonObject = jsonDecode(apiResult.body);
    var userData  = (jsonObject as Map<String, dynamic>)['message'];

    return compute(modelFromJson, jsonEncode(userData));
  }

  @override
  WorkerState fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return null;
  }

  @override
  Map<String, String> toJson(WorkerState state) {
    // TODO: implement toJson
    return null;
  }
}

class DetailBloc extends Bloc<int, SingleState> {

  @override
  get initialState => UndefinedSingle();

  @override
  Stream<SingleState> mapEventToState(event) async* {
    if (event != null) {
      if (event > 0) {
        try {
          Worker data = await getWorker(event);
          yield SingleLoaded(data: data);
        } catch (e) {
          print(e.toString());
        }
      }else{
        print("Dispose");
        yield UndefinedSingle();
      }
    }
  }

  static Future<Worker> getWorker(int id) async {
    String apiUrl = "http://api.housesolutionsindonesia.com/api/v1/customer/worker/$id/bbe439c339c73c3c15aa68b72446d385490ca27e";
    
    var apiResult = await http.get(apiUrl, headers: {"Content-Type":"application/json"});
    var jsonObject = jsonDecode(apiResult.body);
    var userData  = (jsonObject as Map<String, dynamic>)['message'];

    return compute(workerFromJson, jsonEncode(userData));
  }

}