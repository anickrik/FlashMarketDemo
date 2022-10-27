
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:flash_market/model/home/flash_market_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login/login_model.dart';


class Auth with ChangeNotifier {

  var token;

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = token;
    prefs.setString(key, value);
  }


  read() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }


  // Future<void> _authenticate(
  //     String mobileNumber, String password,) async {
  //   final url = Uri.parse(
  //       'https://beta.flashmarket.com.au/api/web/v2/login');
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         'x-api-token': 'B4121C817C7E61869FEB4DE25E6A6',
  //       },
  //       body: {
  //         'params' :'{"password":"$password","mobileNumber":"$mobileNumber"}'
  //       }
  //     );
  //     print(jsonDecode(response.body));
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }

  // Future<void> signUp(String email, String password) async {
  //   return _authenticate(email, password, 'signUp');
  // }

  Future<LoginModel> logIn(String mobileNumber, String password) async {
    final url = Uri.parse(
        'https://beta.flashmarket.com.au/api/web/v2/login');
      final response = await http.post(
          url,
          headers: {
            'x-api-token': 'B4121C817C7E61869FEB4DE25E6A6',
          },
          body: {
            'params' :'{"password":"$password","mobileNumber":"$mobileNumber"}'
          }
      );
    final responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      LoginModel loginModel =  LoginModel.fromJson(responseJson);
      _save(loginModel.result?.userInfo?.headerToken as String);

      print(loginModel.result?.userInfo?.headerToken.toString());
      return LoginModel.fromJson(responseJson);

    } else {
      throw Exception('Some Error Occurred');
    }

  }

  // Future<void> logIn(String mobileNumber, String password) async {
  //   var headers = {'x-api-token': 'B4121C817C7E61869FEB4DE25E6A6',
  //   };
  //   var request = http.MultipartRequest('POST', Uri.parse('https://beta.flashmarket.com.au/api/web/v2/login'));
  //   request.fields.addAll({
  //     'params': '{"password":"$password","mobileNumber":"$mobileNumber"}'
  //   });
  //
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  //   }


  Future<FlashMarketModel> fetchDataFromServer() async {
    final url =
    Uri.parse('https://beta.flashmarket.com.au/api/web/v2/get-home-list');
    read();
    final prefs = await SharedPreferences.getInstance();
    const key = 'token';
    final value = prefs.get(key ) ?? 0;

    final response = await http.post(
      url,
      headers: {
        // HttpHeaders.authorizationHeader: 'guGksV2kBS8cP3R0KCDNZyceUy5CCbWKlrIGKDiq4w0=',
        'x-api-token': 'B4121C817C7E61869FEB4DE25E6A6',
        'Authorization': 'Basic YmV0YWZtYXV0aDpua3M2Yjgxc2hkMDJrZw==',
        'headerToken': value.toString(),
      },
    );
    final responseJson = jsonDecode(response.body);
    // print(responseJson);

    if (response.statusCode == 200) {
      return FlashMarketModel.fromJson(responseJson);
    } else {
      throw Exception('Some Error Occurred');
    }
  }

}