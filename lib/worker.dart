// To parse this JSON data, do
//
//     final worker = workerFromJson(jsonString);

import 'dart:convert';

Worker workerFromJson(String str) => Worker.fromJson(json.decode(str));

String workerToJson(Worker data) => json.encode(data.toJson());

class Worker {
    int idWorker;
    int idProvince;
    int idDistrict;
    String workerName;
    String workerRating;
    String workerSalary;
    String workerDesc;
    String workerWeight;
    String workerHeight;
    String provinceName;
    String districtName;
    int workerAge;
    bool paid;
    String workerProfile;
    String categoryDesc;
    WorkerMore workerMore;
    List<dynamic> workerCertificate;
    List<String> workerPlacement;
    List<String> workerSkills;

    Worker({
        this.idWorker,
        this.idProvince,
        this.idDistrict,
        this.workerName,
        this.workerRating,
        this.workerSalary,
        this.workerDesc,
        this.workerWeight,
        this.workerHeight,
        this.provinceName,
        this.districtName,
        this.workerAge,
        this.paid,
        this.workerProfile,
        this.categoryDesc,
        this.workerMore,
        this.workerCertificate,
        this.workerPlacement,
        this.workerSkills,
    });

    factory Worker.fromJson(Map<String, dynamic> json) => Worker(
        idWorker: json["id_worker"] == null ? null : json["id_worker"],
        idProvince: json["id_province"] == null ? null : json["id_province"],
        idDistrict: json["id_district"] == null ? null : json["id_district"],
        workerName: json["worker_name"] == null ? null : json["worker_name"],
        workerRating: json["worker_rating"] == null ? null : json["worker_rating"],
        workerSalary: json["worker_salary"] == null ? null : json["worker_salary"],
        workerDesc: json["worker_desc"] == null ? null : json["worker_desc"],
        workerWeight: json["worker_weight"] == null ? null : json["worker_weight"],
        workerHeight: json["worker_height"] == null ? null : json["worker_height"],
        provinceName: json["province_name"] == null ? null : json["province_name"],
        districtName: json["district_name"] == null ? null : json["district_name"],
        workerAge: json["worker_age"] == null ? null : json["worker_age"],
        paid: json["paid"] == null ? null : json["paid"],
        workerProfile: json["worker_profile"] == null ? null : json["worker_profile"],
        categoryDesc: json["category_desc"] == null ? null : json["category_desc"],
        workerMore: json["worker_more"] == null ? null : WorkerMore.fromJson(json["worker_more"]),
        workerCertificate: json["worker_certificate"] == null ? null : List<dynamic>.from(json["worker_certificate"].map((x) => x)),
        workerPlacement: json["worker_placement"] == null ? null : List<String>.from(json["worker_placement"].map((x) => x)),
        workerSkills: json["worker_skills"] == null ? null : List<String>.from(json["worker_skills"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id_worker": idWorker == null ? null : idWorker,
        "id_province": idProvince == null ? null : idProvince,
        "id_district": idDistrict == null ? null : idDistrict,
        "worker_name": workerName == null ? null : workerName,
        "worker_rating": workerRating == null ? null : workerRating,
        "worker_salary": workerSalary == null ? null : workerSalary,
        "worker_desc": workerDesc == null ? null : workerDesc,
        "worker_weight": workerWeight == null ? null : workerWeight,
        "worker_height": workerHeight == null ? null : workerHeight,
        "province_name": provinceName == null ? null : provinceName,
        "district_name": districtName == null ? null : districtName,
        "worker_age": workerAge == null ? null : workerAge,
        "paid": paid == null ? null : paid,
        "worker_profile": workerProfile == null ? null : workerProfile,
        "category_desc": categoryDesc == null ? null : categoryDesc,
        "worker_more": workerMore == null ? null : workerMore.toJson(),
        "worker_certificate": workerCertificate == null ? null : List<dynamic>.from(workerCertificate.map((x) => x)),
        "worker_placement": workerPlacement == null ? null : List<dynamic>.from(workerPlacement.map((x) => x)),
        "worker_skills": workerSkills == null ? null : List<dynamic>.from(workerSkills.map((x) => x)),
    };
}

class WorkerMore {
    bool wmoreStayIn;
    String wmoreChildren;
    String wmoreStatus;
    String wmoreReligion;
    bool wmoreAbroadEx;
    String wmoreLanguage;
    String wmorePhobia;

    WorkerMore({
        this.wmoreStayIn,
        this.wmoreChildren,
        this.wmoreStatus,
        this.wmoreReligion,
        this.wmoreAbroadEx,
        this.wmoreLanguage,
        this.wmorePhobia,
    });

    factory WorkerMore.fromJson(Map<String, dynamic> json) => WorkerMore(
        wmoreStayIn: json["wmore_stay_in"] == null ? null : json["wmore_stay_in"],
        wmoreChildren: json["wmore_children"] == null ? null : json["wmore_children"],
        wmoreStatus: json["wmore_status"] == null ? null : json["wmore_status"],
        wmoreReligion: json["wmore_religion"] == null ? null : json["wmore_religion"],
        wmoreAbroadEx: json["wmore_abroad_ex"] == null ? null : json["wmore_abroad_ex"],
        wmoreLanguage: json["wmore_language"] == null ? null : json["wmore_language"],
        wmorePhobia: json["wmore_phobia"] == null ? null : json["wmore_phobia"],
    );

    Map<String, dynamic> toJson() => {
        "wmore_stay_in": wmoreStayIn == null ? null : wmoreStayIn,
        "wmore_children": wmoreChildren == null ? null : wmoreChildren,
        "wmore_status": wmoreStatus == null ? null : wmoreStatus,
        "wmore_religion": wmoreReligion == null ? null : wmoreReligion,
        "wmore_abroad_ex": wmoreAbroadEx == null ? null : wmoreAbroadEx,
        "wmore_language": wmoreLanguage == null ? null : wmoreLanguage,
        "wmore_phobia": wmorePhobia == null ? null : wmorePhobia,
    };
}
