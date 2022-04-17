import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../model/data_model.dart';

class DataServices {
  String baseUrl = "http://someapi.com/api";
  String baseDumbDataPath = "assets/dumb_data/";

  Future<List<DataModel>> getDumbInfo() async {
    var fileName = 'places.json';
    var raw = await rootBundle.loadString(baseDumbDataPath + fileName);
    try {
      List<dynamic> list = json.decode(raw);
      return list.map((e) => DataModel.fromJson(e)).toList();
    } catch (e) {
      log("error: $e");
      return <DataModel>[];
    }
  }

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';
    var res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      log("error: $e");
      return <DataModel>[];
    }
  }
}
