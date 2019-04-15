import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Request {

  static Future<dynamic> get({String action, Map param}) async {
    return Request.mock(action, param);
  }

  static Future<dynamic> post({String action, Map param}) async {
    return Request.mock(action, param);
  }

  static Future<dynamic> mock(String action, Map param) async {
    var responseStr = await rootBundle.loadString('mock/$action.json');
    var responseJson = json.decode(responseStr);
    return responseJson['data'];
  }


}