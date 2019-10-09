// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
    int page;
    int limit;
    int paging;
    List<Datum> data;

    Model({
        this.page,
        this.limit,
        this.paging,
        this.data,
    });

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        page: json["page"] == null ? null : json["page"],
        limit: json["limit"] == null ? null : json["limit"],
        paging: json["paging"] == null ? null : json["paging"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "limit": limit == null ? null : limit,
        "paging": paging == null ? null : paging,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };



    static Future<Model> searchWorker([page = 1]) async {
      String apiUrl = "http://api.housesolutionsindonesia.com/api/v1/customer/search/bbe439c339c73c3c15aa68b72446d385490ca27e";
      String body = jsonEncode({"id_province":"all","id_district":[],"id_category":"all","salary_from":0,"salary_until":0,"rating_from":0,"rating_until":0,"page":page,"limit":50});
      print(body);
      
      var apiResult = await http.post(apiUrl, body: body, headers: {"Content-Type":"application/json"});
      var jsonObject = jsonDecode(apiResult.body);
      var userData  = (jsonObject as Map<String, dynamic>)['message'];

      return compute(modelFromJson, jsonEncode(userData));
    }
}

class Datum {
    // int idCategory;
    String categoryDesc;
    int idWorker;
    // int idProvince;
    // int idDistrict;
    String workerName;
    String workerRating;
    String workerSalary;
    // String workerSlug;
    String provinceName;
    String districtName;
    int workerAge;
    String workerProfile;
    // bool stayIn;

    Datum({
        // this.idCategory,
        this.categoryDesc,
        this.idWorker,
        // this.idProvince,
        // this.idDistrict,
        this.workerName,
        this.workerRating,
        this.workerSalary,
        // this.workerSlug,
        this.provinceName,
        this.districtName,
        this.workerAge,
        this.workerProfile,
        // this.stayIn,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        // idCategory: json["id_category"] == null ? null : json["id_category"],
        categoryDesc: json["category_desc"] == null ? null : json["category_desc"],
        idWorker: json["id_worker"] == null ? null : json["id_worker"],
        // idProvince: json["id_province"] == null ? null : json["id_province"],
        // idDistrict: json["id_district"] == null ? null : json["id_district"],
        workerName: json["worker_name"] == null ? null : json["worker_name"],
        workerRating: json["worker_rating"] == null ? null : json["worker_rating"],
        workerSalary: json["worker_salary"] == null ? null : json["worker_salary"],
        // workerSlug: json["worker_slug"] == null ? null : json["worker_slug"],
        provinceName: json["province_name"] == null ? null : json["province_name"],
        districtName: json["district_name"] == null ? null : json["district_name"],
        workerAge: json["worker_age"] == null ? null : json["worker_age"],
        workerProfile: json["worker_profile"] == null ? null : json["worker_profile"],
        // stayIn: json["stay_in"] == null ? null : json["stay_in"],
    );

    Map<String, dynamic> toJson() => {
        // "id_category": idCategory == null ? null : idCategory,
        "category_desc": categoryDesc == null ? null : categoryDesc,
        "id_worker": idWorker == null ? null : idWorker,
        // "id_province": idProvince == null ? null : idProvince,
        // "id_district": idDistrict == null ? null : idDistrict,
        "worker_name": workerName == null ? null : workerName,
        "worker_rating": workerRating == null ? null : workerRating,
        "worker_salary": workerSalary == null ? null : workerSalary,
        // "worker_slug": workerSlug == null ? null : workerSlug,
        "province_name": provinceName == null ? null : provinceName,
        "district_name": districtName == null ? null : districtName,
        "worker_age": workerAge == null ? null : workerAge,
        "worker_profile": workerProfile == null ? null : workerProfile,
        // "stay_in": stayIn == null ? null : stayIn,
    };
}

// class UndefinedModel extends Model {}