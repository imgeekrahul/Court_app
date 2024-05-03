import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CaseService {
  static Future<List?> fetchCases() async {
    final url = "http://localhost:5000/v1/details/case";
    final uri = Uri.parse(url);

    final response = await http.get(uri);
    if(response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = json["data"];
      return result;
    } else {
      return null;
    }
  } 

  static Future<bool> updateCaseData(String id, Map data) async {
    final url = "http://localhost:5000/v1/update/${id}/case";

    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(data),
      headers: {
        'Content-type': 'application/json'
      }
    );

    return response.statusCode == 200;
  }
}