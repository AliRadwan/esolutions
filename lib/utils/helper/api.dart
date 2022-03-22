import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> post(
      {required String url, @required dynamic body, String? token}) async {
    Map<String, String> headers = {
      'lang': 'ar',
    };

    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      Get.snackbar('Error', 'Error From Server',
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
          snackPosition: SnackPosition.BOTTOM);
      throw Exception(
          'there is error${jsonDecode(response.statusCode.toString())}');
    }
  }
}
