// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

List<dynamic> Listuser = [];

void main() {
 getProjectByCategorymobile() async {
    Uri url = Uri.parse("https://reqres.in/api/users?page=1&per_page=10");

    try {
      final response = await http.get(url);
      var data = json.decode(response.body) as Map<String, dynamic>;

      Listuser = data["data"][0] as List<dynamic>;
      
      print(Listuser);
    } catch (err) {
      print(" Kenapa ${err}");
      // return List<Project>.empty();
    }
  }
}
