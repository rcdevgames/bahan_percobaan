// To parse this JSON data, do
//
//     final worker = workerFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Worker workerFromJson(String str) => Worker.fromJson(json.decode(str));

String workerToJson(Worker data) => json.encode(data.toJson());

class Worker {
    List<Datum> data;
    int paging;
    int limit;
    int page;

    Worker({
        this.data,
        this.paging,
        this.limit,
        this.page,
    });

    factory Worker.fromJson(Map<String, dynamic> json) => Worker(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        paging: json["paging"] == null ? null : json["paging"],
        limit: json["limit"] == null ? null : json["limit"],
        page: json["page"] == null ? null : json["page"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
        "paging": paging == null ? null : paging,
        "limit": limit == null ? null : limit,
        "page": page == null ? null : page,
    };

    static Future<Worker> searchWorker() async {
      var apiResult = await http.get("http://www.json-generator.com/api/json/get/cePUcXWfEy?indent=2");
      if (apiResult.statusCode == 200) {
        var jsonObject = jsonDecode(apiResult.body);
        var userData  = (jsonObject as Map<String, dynamic>);
        return compute(workerFromJson, jsonEncode(userData));
      }else{
        throw Exception(apiResult.body);
      }
    }
}

class Datum {
    int workerRating;
    int workerSalary;
    String workerProfile;
    int workerAge;
    int idWorker;
    String workerName;
    String districtName;
    String categoryDesc;
    String provinceName;

    Datum({
        this.workerRating,
        this.workerSalary,
        this.workerProfile,
        this.workerAge,
        this.idWorker,
        this.workerName,
        this.districtName,
        this.categoryDesc,
        this.provinceName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        workerRating: json["worker_rating"] == null ? null : json["worker_rating"],
        workerSalary: json["worker_salary"] == null ? null : json["worker_salary"],
        workerProfile: json["worker_profile"] == null ? null : json["worker_profile"],
        workerAge: json["worker_age"] == null ? null : json["worker_age"],
        idWorker: json["id_worker"] == null ? null : json["id_worker"],
        workerName: json["worker_name"] == null ? null : json["worker_name"],
        districtName: json["district_name"] == null ? null : json["district_name"],
        categoryDesc: json["category_desc"] == null ? null : json["category_desc"],
        provinceName: json["province_name"] == null ? null : json["province_name"],
    );

    Map<String, dynamic> toJson() => {
        "worker_rating": workerRating == null ? null : workerRating,
        "worker_salary": workerSalary == null ? null : workerSalary,
        "worker_profile": workerProfile == null ? null : workerProfile,
        "worker_age": workerAge == null ? null : workerAge,
        "id_worker": idWorker == null ? null : idWorker,
        "worker_name": workerName == null ? null : workerName,
        "district_name": districtName == null ? null : districtName,
        "category_desc": categoryDesc == null ? null : categoryDesc,
        "province_name": provinceName == null ? null : provinceName,
    };
}

class UndefinedWorker extends Worker {}