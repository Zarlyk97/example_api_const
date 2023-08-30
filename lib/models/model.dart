import 'dart:convert';

import 'package:exemple_api_const/models/address_model.dart';
import 'package:exemple_api_const/models/company_model.dart';

List<Usermodel> usermodelFromJson(String str) =>
    List<Usermodel>.from(json.decode(str).map((x) => Usermodel.fromJson(x)));

String usermodelToJson(List<Usermodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usermodel {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  Usermodel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
      };
}
