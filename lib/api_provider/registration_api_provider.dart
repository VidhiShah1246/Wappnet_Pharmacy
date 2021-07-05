import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmacy/models/login_model.dart';


class LoginApiProvider {
  static const BASEURL = "https://staging.kynzagroup.ca/api/";
  
  Future<String> fetchSigninRespose(var body) async {
    final response = await http.post(
      Uri.parse(BASEURL + 'login'),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: body,
    ).timeout(
      Duration(minutes: 1),
      onTimeout: () => throw Exception('Failed to load'),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load');
    }
  }

}
