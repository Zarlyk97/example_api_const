import 'dart:math';

import 'package:exemple_api_const/constants/api_const.dart';
import 'package:exemple_api_const/models/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Usermodel>?> getUsers() async {
    try {
      var uri = Uri.parse(ApiConst.baseurl + ApiConst.usersEndpoint);
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        List<Usermodel> model = usermodelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString() as num);
    }
    return null;
  }
}
